class ApiEndpoints {
  // Localhost ios emulator 127.0.01 or localhost
  // Localhost android emulator 10.0.2.2
  static const url = 'http://127.0.0.1:8000';
  static const version = 'api/v1';

  static String get baseUrl => '$url/$version';
}
