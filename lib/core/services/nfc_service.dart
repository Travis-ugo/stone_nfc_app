import 'dart:convert';
import 'dart:async';
import 'dart:typed_data';

import 'package:nfc_manager/ndef_record.dart';
import 'package:nfc_manager/nfc_manager.dart';

import 'package:nfc_manager_ndef/nfc_manager_ndef.dart';

import 'package:tag_play/core/core.dart';

class NfcService {
  /// Reads plain text from an NFC tag
  Future<String?> scanNfcTag({
    Duration timeout = const Duration(seconds: 20),
  }) async {
    if (!await NfcManager.instance.isAvailable()) {
      print("NFC is not available on this device");
      return null;
    }

    // Always try to stop any previous session before starting a new one
    try {
      await NfcManager.instance.stopSession();
    } catch (_) {}

    final completer = Completer<String?>();

    await NfcManager.instance.startSession(
      pollingOptions: {NfcPollingOption.iso14443},
      alertMessageIos: 'Hold your device near the NFC tag',
      onDiscovered: (NfcTag tag) async {
        try {
          final ndef = Ndef.from(tag);
          if (ndef?.cachedMessage?.records.isNotEmpty ?? false) {
            final record = ndef!.cachedMessage!.records.first;
            final text = _decodeTextRecord(record);

            HapticFeedback.mediumImpact();

            completer.complete(text);
          } else {
            completer.complete(null);
          }
        } catch (e) {
          completer.completeError(e);
        } finally {
          await NfcManager.instance.stopSession();
        }
      },
    );

    return completer.future.timeout(
      timeout,
      onTimeout: () {
        NfcManager.instance.stopSession(errorMessageIos: 'Scan timed out');
        return null;
      },
    );
  }

  /// Writes plain text to an NFC tag
  Future<bool> writeNfcTag(
    String text, {
    Duration timeout = const Duration(seconds: 20),
  }) async {
    if (!await NfcManager.instance.isAvailable()) {
      print("NFC is not available on this device");
      return false;
    }

    // Always try to stop any previous session before starting a new one
    try {
      await NfcManager.instance.stopSession();
    } catch (_) {}

    bool success = false;

    await NfcManager.instance.startSession(
      pollingOptions: {NfcPollingOption.iso14443},
      alertMessageIos: 'Hold your device near the NFC tag to write',
      onDiscovered: (NfcTag tag) async {
        try {
          final ndef = Ndef.from(tag);

          if (ndef == null || !ndef.isWritable) {
            throw Exception("Tag is not writable");
          }

          final record = _createTextRecord(text);
          await ndef.write(message: NdefMessage(records: [record]));

          success = true;
        } catch (e) {
          print("NFC write error: $e");
          await NfcManager.instance.stopSession(errorMessageIos: e.toString());
        } finally {
          await NfcManager.instance.stopSession();
        }
      },
    );

    // Add a timeout safeguard
    return Future.value(success).timeout(
      timeout,
      onTimeout: () {
        NfcManager.instance.stopSession(errorMessageIos: 'Write timed out');
        return false;
      },
    );
  }

  /// Creates an NDEF text record for writing
  NdefRecord _createTextRecord(String text, {String languageCode = 'en'}) {
    final langBytes = utf8.encode(languageCode);
    final textBytes = utf8.encode(text);

    // Total length = 1 byte for lang length + lang bytes + text bytes
    final totalLength = 1 + langBytes.length + textBytes.length;

    final payload = Uint8List(totalLength);
    payload[0] = langBytes.length;
    payload.setRange(1, 1 + langBytes.length, langBytes);
    payload.setRange(1 + langBytes.length, totalLength, textBytes);

    return NdefRecord(
      typeNameFormat: TypeNameFormat.wellKnown,
      type: Uint8List.fromList(utf8.encode('T')),
      identifier: Uint8List(0),
      payload: payload,
    );
  }

  /// Decodes a plain text NDEF record
  String? _decodeTextRecord(NdefRecord record) {
    if (record.typeNameFormat != TypeNameFormat.wellKnown ||
        utf8.decode(record.type) != 'T') {
      return null;
    }

    final payload = record.payload;
    final langLength = payload[0] & 0x3F;
    return utf8.decode(payload.sublist(1 + langLength));
  }
}
