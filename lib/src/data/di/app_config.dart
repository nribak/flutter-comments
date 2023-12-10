import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static AppConfig? _instance;

  AppConfig._internal();

  String get apiBaseUrl => dotenv.env['API_BASE_URL'] ?? '';
  String get apiKey => dotenv.env['API_KEY'] ?? '';
  String get userId => dotenv.env['USER_ID'] ?? '';

  factory AppConfig.instance() {
    var value = _instance;
    if(value != null) {
      return value;
    } else {
      value = AppConfig._internal();
      _instance = value;
      return value;
    }
  }


}