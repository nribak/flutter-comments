import 'package:comments_app/src/utils/extensions.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

enum AppEnvironment {
  production, development
}
/*
.env template:

API_KEY=***
USER_ID=***
API_BASE_URL=***
ENV=development/production
 */


class AppConfig {
  static AppConfig? _instance;

  AppConfig._internal();

  String get apiBaseUrl => dotenv.get('API_BASE_URL');
  String get apiKey => dotenv.get('API_KEY');
  String get userId => dotenv.get('USER_ID');

  AppEnvironment get environment =>
      dotenv.get('ENV').let((env) => env == 'production' ? AppEnvironment.production : AppEnvironment.development);

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