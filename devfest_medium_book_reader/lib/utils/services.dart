import 'package:flutter/services.dart';

// dont use any package other than flutter/services
// you can use any class from flutter/services

class AppServices {
  static const platform = MethodChannel("samples.flutter.dev/");

  static Future<bool> checkConnectivity() async {
    try {
      // i know spelling is wrong , ani dr7t n3awd n runni Xd
      final result = await platform.invokeMethod<bool>('checkConnectivity');
      return result as bool;
    } on PlatformException catch (e) {
      rethrow;
    }
  }
}
