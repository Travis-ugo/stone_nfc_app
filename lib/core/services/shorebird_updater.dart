import 'dart:developer' as developer;

import 'package:shorebird_code_push/shorebird_code_push.dart' as shorebird;

class ShorebirdUpdaterWrapper {
  /// Checks for and applies updates using pkg:shorebird_code_push high-level API.
  static Future<void> checkAndInstallUpdates({bool verbose = true}) async {
    try {
      final updater = shorebird.ShorebirdUpdater();
      if (!updater.isAvailable) {
        if (verbose) developer.log('Shorebird updater unavailable in this build');
        return;
      }
      final status = await updater.checkForUpdate();
      if (verbose) developer.log('Shorebird status: ${status.name}');
      await updater.update();
      if (verbose) developer.log('Shorebird update: completed (applies on restart)');
    } catch (e, st) {
      if (verbose) developer.log('Shorebird update failed: $e', stackTrace: st);
    }
  }
}


