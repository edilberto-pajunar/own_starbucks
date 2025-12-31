import 'dart:io';

import 'package:flutter/foundation.dart';

class ApiEndpoints {
  // Localhost ios emulator 127.0.0.1 or localhost
  // Localhost android emulator 10.0.2.2
  // Localhost web 127.0.0.1
  static const mobileUrl = 'http://10.0.2.2:9000';
  static const iosUrl = 'http://127.0.0.1:9000';
  static const webUrl = 'http://localhost:9000';
  static const version = 'api/v1';

  static String get baseUrl {
    if (kIsWeb) return '$webUrl/$version';
    if (Platform.isAndroid) return '$mobileUrl/$version';
    if (Platform.isIOS) return '$iosUrl/$version';
    return '$iosUrl/$version';
  }
}
