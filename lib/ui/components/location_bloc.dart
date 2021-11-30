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
abstract class GetLocationState extends Equatable {
  String imageMapUrlSuper;
  double latitudeSuper;
  double longitudeSuper;

  GetLocationState({
    required this.imageMapUrlSuper,
    required this.latitudeSuper,
    required this.longitudeSuper,
  });

  @override
  List<Object> get props => [];
}

//Start Inicial
class GetLocationInicialState extends GetLocationState {
  String imageMapUrl;

  GetLocationInicialState({required this.imageMapUrl})
      : super(imageMapUrlSuper: '', latitudeSuper: 0.0, longitudeSuper: 0.0);
}

class CurrentLocationGettedState extends GetLocationState {
  String imageMapUrl;
  double latitude;
  double longitude;

  CurrentLocationGettedState({
    required this.imageMapUrl,
    required this.latitude,
    required this.longitude,
  }) : super(
            imageMapUrlSuper: imageMapUrl,
            longitudeSuper: longitude,
            latitudeSuper: latitude);
}

class MapPointerLocationGettedState extends GetLocationState {
  String imageMapUrl;
  double latitude;
  double longitude;

  MapPointerLocationGettedState({
    required this.imageMapUrl,
    required this.latitude,
    required this.longitude,
  }) : super(
            imageMapUrlSuper: '',
            latitudeSuper: latitude,
            longitudeSuper: longitude);
}
