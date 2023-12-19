

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

  String get apiBaseUrl => "sample-comments-service-5y6owysdhq-uc.a.run.app";//dotenv.get('API_BASE_URL');
  String get apiKey => "795cfec4-68b1-42d6-baa0-16a53ce09a1d";//dotenv.get('API_KEY');
  String get userId => "tempUserId";//dotenv.get('USER_ID');

  AppEnvironment get environment => AppEnvironment.production;
      // dotenv.get('ENV').let((env) => env == 'production' ? AppEnvironment.production : AppEnvironment.development);

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