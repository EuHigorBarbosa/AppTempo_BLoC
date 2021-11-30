import 'package:location/location.dart';
import 'package:weather_app/data/repository/location_repo.dart';

const _GOOGLE_API_KEY = 'AIzaSyC1tdX5jCRZ9dyV65ThFZd9hdSsptTk8ZI';

class LocationGoogleRepository implements LocationRepository {
  @override
  Future<Map<String, Object>> getUrlLocationPhoto() async {
    late double latitudeChoosed;
    late double longitudeChoosed;
    try {
      final locData = await Location().getLocation();
      // print('XXXXX ${locData.latitude}');
      // print('YYYYY ${locData.longitude}');
      if (locData.latitude == null || locData.longitude == null) {
        return {};
      }
      latitudeChoosed = locData.latitude!;
      longitudeChoosed = locData.longitude!;
    } catch (e) {
      print(e);
    }
    return {
      'imageUrl':
          'https://maps.googleapis.com/maps/api/staticmap?center=$latitudeChoosed,$longitudeChoosed&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%$latitudeChoosed,$longitudeChoosed&key=$_GOOGLE_API_KEY',
      'latitude': latitudeChoosed,
      'longitude': longitudeChoosed
    };
  }

  Future<Map<String, double>> getLatLongCurrentUser() async {
    final locData = await Location().getLocation();
    assert(locData.latitude != null);
    return {'latitude': locData.latitude!, 'longitude': locData.longitude!};
  }
}
