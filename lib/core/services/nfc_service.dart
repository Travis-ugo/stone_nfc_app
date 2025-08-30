import 'dart:convert';
import 'dart:async';
import 'package:nfc_manager/ndef_record.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager_ndef/nfc_manager_ndef.dart';

import 'package:tag_play/core/core.dart';

class NfcService {
  /// Reads plain text from an NFC tag (only NDEF supported)
  Future<String?> scanNfcTag({
    Duration timeout = const Duration(seconds: 20),
  }) async {
    if (!await NfcManager.instance.isAvailable()) {
      throw Exception("NFC is not available on this device");
    }

    // Stop any previous session first
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

          if (ndef == null) {
            throw Exception("Unsupported NFC tag (not NDEF)");
          }

          if (ndef.cachedMessage?.records.isNotEmpty ?? false) {
            final record = ndef.cachedMessage!.records.first;
            final text = _decodeTextRecord(record);

            if (text == null) {
              throw Exception("Failed to decode NDEF text record");
            }

            HapticFeedback.mediumImpact();
            completer.complete(text);
          } else {
            throw Exception("Empty NFC tag (no records found)");
          }
        } catch (e) {
          completer.completeError(e);
          await NfcManager.instance
              .stopSession(errorMessageIos: e.toString());
          return;
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

  /// Writes plain text to an NFC tag (only NDEF supported)
  Future<bool> writeNfcTag(
    String text, {
    Duration timeout = const Duration(seconds: 20),
  }) async {
    if (!await NfcManager.instance.isAvailable()) {
      throw Exception("NFC is not available on this device");
    }

    // Stop any previous session first
    try {
      await NfcManager.instance.stopSession();
    } catch (_) {}

    final completer = Completer<bool>();

    await NfcManager.instance.startSession(
      pollingOptions: {NfcPollingOption.iso14443},
      alertMessageIos: 'Hold your device near the NFC tag to write',
      onDiscovered: (NfcTag tag) async {
        try {
          final ndef = Ndef.from(tag);

          if (ndef == null) {
            throw Exception("Unsupported NFC tag (not NDEF)");
          }

          if (!ndef.isWritable) {
            throw Exception("Tag is not writable");
          }

          final record = _createTextRecord(text);
          await ndef.write(message: NdefMessage(records: [record]));

          HapticFeedback.mediumImpact();
          completer.complete(true);
        } catch (e) {
          completer.completeError(e);
          await NfcManager.instance
              .stopSession(errorMessageIos: e.toString());
          return;
        } finally {
          await NfcManager.instance.stopSession();
        }
      },
    );

    return completer.future.timeout(
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

    final payload = Uint8List(1 + langBytes.length + textBytes.length);
    payload[0] = langBytes.length;
    payload.setRange(1, 1 + langBytes.length, langBytes);
    payload.setRange(1 + langBytes.length, payload.length, textBytes);

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
