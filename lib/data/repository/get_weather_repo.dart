import 'package:weather_app/data/repository/get_weather_weather_api.dart';

abstract class GetWeatherRepo {
  Future<Map<String, Object>> getWeather(
      double latitudeArg, double longitudeArg);

  factory GetWeatherRepo() {
    ///Ver a aula 384 para saber sobre factories
    //return AuthMockService();
    return GetWeatherFromWeatherAPI();
  }
}
