import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';

import 'package:weather_app/data/repository/location_google_api.dart';

const _GOOGLE_API_KEY = 'AIzaSyC1tdX5jCRZ9dyV65ThFZd9hdSsptTk8ZI';

class GetLocationBloc extends Bloc<GetLocationEvent, GetLocationState> {
  GetLocationBloc(GetLocationState initialState) : super(initialState);

  double latitudeChoosed = 0.0;
  double longitudeChoosed = 0.0;

  GetLocationState get initialState => GetLocationInicialState(imageMapUrl: '');

  //Parte da Api Google
  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    print('XXXXX ${locData.latitude}');
    print(locData.longitude);
    if (locData.latitude == null) {
      return print('o getLocation está retornando null');
    }
    latitudeChoosed = locData.latitude!;
    longitudeChoosed = locData.longitude!;
  }

  String generateLocationPreviewImage(
      {required double latitude, required double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%$latitude,$longitude&key=$_GOOGLE_API_KEY';
  }

  @override
  Stream<GetLocationState> mapEventToState(GetLocationEvent event) async* {
    //?enum CounterHourEvent { increment, decrement, reset }

    print('O tipo do evento é ${event.runtimeType}');
    if (event.runtimeType == GetLocationFromHereEvent) {
      // await _getCurrentUserLocation();

      // yield CurrentLocationGettedState(
      //     imageMapUrl: generateLocationPreviewImage(
      //         latitude: latitudeChoosed, longitude: longitudeChoosed));
      print('${await LocationGoogleRepository().getUrlLocationPhoto()}');
      final mapReceivedFromRepo =
          await LocationGoogleRepository().getUrlLocationPhoto();
      print('Esta é a imageUrl: ${mapReceivedFromRepo['imageUrl']}');
      yield CurrentLocationGettedState(
          longitude: mapReceivedFromRepo['longitude'] as double,
          latitude: mapReceivedFromRepo['latitude'] as double,
          imageMapUrl: mapReceivedFromRepo['imageUrl'] as String);
      // print(
      //     'Este é o link qu equero buscar${generateLocationPreviewImage(latitude: latitudeChoosed, longitude: longitudeChoosed)}');
    }
    //    if (event.runtimeType == GetLocationEventFromMapPoint) {
    // _getMapLocation();
    // yield MapPointerLocationGettedState(latitude: latitudeChoosed, longitude: longitudeChoosed);
    // }

    print('O valor de latitude depois dos ifs é $latitudeChoosed');
  }
}
//===============================================================

abstract class GetLocationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetLocationFromHereEvent extends GetLocationEvent {
  GetLocationFromHereEvent() : super();
}

class GetLocationEventFromMapPoint extends GetLocationEvent {
  GetLocationEventFromMapPoint() : super();
}

//!=================================================
// {
//     "location": {
//         "name": "Joao Pinheiro",
//         "region": "Minas Gerais",
//         "country": "Brazil",
//         "lat": -17.74,
//         "lon": -46.17,
//         "tz_id": "America/Sao_Paulo",
//         "localtime_epoch": 1638305603,
//         "localtime": "2021-11-30 17:53"
//     },
//     "current": {
//         "last_updated_epoch": 1638305100,
//         "last_updated": "2021-11-30 17:45",
//         "temp_c": 28.6,
//         "temp_f": 83.5,
//         "is_day": 1,
//         "condition": {
//             "text": "Patchy rain possible",
//             "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",
//             "code": 1063
//         },
//         "wind_mph": 6.7,
//         "wind_kph": 10.8,
//         "wind_degree": 287,
//         "wind_dir": "WNW",
//         "pressure_mb": 1007.0,
//         "pressure_in": 29.72,
//         "precip_mm": 2.2,
//         "precip_in": 0.09,
//         "humidity": 57,
//         "cloud": 85,
//         "feelslike_c": 30.3,
//         "feelslike_f": 86.5,
//         "vis_km": 9.0,
//         "vis_miles": 5.0,
//         "uv": 6.0,
//         "gust_mph": 10.1,
//         "gust_kph": 16.2
//     }
// }

abstract class GetLocationState extends Equatable {
  String imageMapUrlSuper;
  double latitudeSuper;
  double longitudeSuper;
  String localidadeSuper;
  String regiaoSuper;
  String paisSuper;
  double temperaturaSuper;
  double sensacaoTermicaSuper;
  double humidadeSuper;
  String descriptionConditionSuper;
  String urlIconeTempoSuper;
  GetLocationState({
      required this.imageMapUrlSuper,
    required this.latitudeSuper,
    required this.longitudeSuper,
    required this.localidadeSuper,
    required this.regiaoSuper,
    required this.paisSuper,
    required this.temperaturaSuper,
    required this.sensacaoTermicaSuper,
    required this.humidadeSuper,
    required this.descriptionConditionSuper,
    required this.urlIconeTempoSuper,
  })
  // "location": {
  // "name": "Joao Pinheiro",
  //       "region": "Minas Gerais",
  //       "country": "Brazil",
  // "current": {
  //   "temp_c": 28.6,
  //   "humidity": 57,
  //   feelslike_c": 30.3,
  //   "condition": {
  //             "text": "Patchy rain possible",
  //             "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",

  @override
  List<Object> get props => [
       imageMapUrlSuper,
   latitudeSuper,
   longitudeSuper,
   localidadeSuper,
   regiaoSuper,
   paisSuper,
   temperaturaSuper,
   sensacaoTermicaSuper,
   humidadeSuper,
   descriptionConditionSuper,
   urlIconeTempoSuper,
  ];
}

//Start Inicial
class GetLocationInicialState extends GetLocationState {
  String imageMapUrl;

  GetLocationInicialState({required this.imageMapUrl})
      : super(
          imageMapUrlSuper: '',
          latitudeSuper: 0.0,
          longitudeSuper: 0.0,
            localidadeSuper: '',
   regiaoSuper: '',
   paisSuper: '',
   temperaturaSuper: 0.0,
   sensacaoTermicaSuper: 0.0,
   humidadeSuper: 0.0,
   descriptionConditionSuper: '',
   urlIconeTempoSuper: '',
        );
}

class CurrentLocationGettedState extends GetLocationState {
  String imageMapUrl;
  double latitude;
  double longitude;
  String localidade;
  String regiao;
  String pais;
  double temperatura;
  double sensacaoTermica;
  double humidade;
  String descriptionCondition;
  String urlIconeTempo;

  CurrentLocationGettedState({
    required this.imageMapUrl,
    required this.latitude,
    required this.longitude,
    required this.localidade,
    required this.regiao,
    required this.pais,
    required this.temperatura,
    required this.sensacaoTermica,
    required this.humidade,
    required this.descriptionCondition,
    required this.urlIconeTempo,
  }) : super(
      imageMapUrlSuper: imageMapUrl,
      longitudeSuper: longitude,
      latitudeSuper: latitude,
      localidadeSuper:localidade,
      regiaoSuper:   regiao,
      paisSuper:   pais,
      temperaturaSuper:   temperatura ,
      sensacaoTermicaSuper: sensacaoTermica,
      humidadeSuper: humidade,
      descriptionConditionSuper: descriptionCondition,
      urlIconeTempoSuper: urlIconeTempo,
   );
}

// class MapPointerLocationGettedState extends GetLocationState {
//   String imageMapUrl;
//   double latitude;
//   double longitude;

//   MapPointerLocationGettedState({
//     required this.imageMapUrl,
//     required this.latitude,
//     required this.longitude,
//   }) : super(
//             imageMapUrlSuper: '',
//             latitudeSuper: latitude,
//             longitudeSuper: longitude);
// }
