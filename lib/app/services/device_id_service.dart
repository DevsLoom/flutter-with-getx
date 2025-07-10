import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';

class DeviceDetails {
  static Future<String> deviceId() async {
    final deviceInfo = DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;

        // Best-effort device identifier
        return androidInfo.id;
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        return iosInfo.identifierForVendor ?? 'Unknown';
      } else {
        return 'Unsupported Platform';
      }
    } catch (e) {
      return 'Error: ${e.toString()}';
    }
  }

  //get device details
  static Future<String> deviceName() async {
    final deviceInfo = DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        return androidInfo.model;
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        return iosInfo.utsname.machine;
      } else {
        return 'Unsupported Platform';
      }
    } catch (e) {
      return 'Error: ${e.toString()}';
    }
  }
}
