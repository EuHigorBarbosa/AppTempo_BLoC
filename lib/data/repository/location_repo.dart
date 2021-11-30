import 'package:equatable/equatable.dart';
import 'package:weather_app/data/repository/location_google_api.dart';

abstract class LocationRepository {
  Future<Map<String, Object>> getUrlLocationPhoto();

  //Future<String> getMapLocation();

  factory LocationRepository() {
    ///Ver a aula 384 para saber sobre factories
    //return AuthMockService();
    return LocationGoogleRepository();
  }
}
