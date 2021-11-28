import 'dart:async';
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/data/model/wheater_model.dart';

class SkyPhotoHourBloc extends Bloc<CounterHourEvent, SkyPhotoState> {
  SkyPhotoHourBloc(SkyPhotoState initialState) : super(initialState);
  int counter = 0;
  SkyPhotoState get initialState =>
      SkyPhotoInicialState(imageUrl: '', dataFromSuccessState: {});

  @override
  Stream<SkyPhotoState> mapEventToState(CounterHourEvent event) async* {
    //?enum CounterHourEvent { increment, decrement, reset }

    print('O tipo do evento é ${event.runtimeType}');
    if (event.runtimeType == CounterHourEventIncrement) counter++;
    if (event.runtimeType == CounterHourEventDecrement) counter--;
    if (event.runtimeType == CounterHourEventReset) counter = -1;
    print('O valor de counter depois dos ifs é $counter');
    // final _stateStreamController = StreamController<SkyPhotoState>();
    // StreamSink<SkyPhotoState> get skyPhotoSink => _stateStreamController.sink;
    // Stream<SkyPhotoState> get skyPhotoStream => _stateStreamController.stream;

    // final _eventStreamController = StreamController<CounterHourEvent>();
    // StreamSink<CounterHourEvent> get eventSink => _eventStreamController.sink;
    // Stream<CounterHourEvent> get eventStream => _eventStreamController.stream;

    // if (counter >  && counter< )
    // {yield SkyPhotoDayState(imageUrl: ,  dataFromSuccessState: );}

    //  if (counter >=5  && counter<6 )
    // {yield SkyPhotoDawnState(imageUrl: , dataFromSuccessState: );}
    print(counter);
    if (counter < 0) {
      yield SkyPhotoInicialState(
          imageUrl: 'lib/asset/images/inicial.png',
          dataFromSuccessState: {'Mensagem': '', 'counterHora': ''});
    }
    if (counter >= 6 && counter < 7) {
      yield SkyPhotoSunriseState(
          imageUrl: 'lib/asset/images/sunrise.png',
          dataFromSuccessState: {'Mensagem': '', 'counterHora': '$counter'});
    }

    if (counter >= 7 && counter < 11) {
      print("Counter de 7 a 11 valor: $counter");
      yield SkyPhotoMorningState(
          imageUrl: 'lib/asset/images/morning.png',
          dataFromSuccessState: {'Mensagem': '', 'counterHora': '$counter'});
    }

    if (counter >= 11 && counter < 13) {
      yield SkyPhotoMiddayState(
          imageUrl: 'lib/asset/images/midday.png',
          dataFromSuccessState: {'Mensagem': '', 'counterHora': '$counter'});
    }

    if (counter >= 13 && counter < 17) {
      yield SkyPhotoAfternoonState(
          imageUrl: 'lib/asset/images/afternoon.png',
          dataFromSuccessState: {'Mensagem': '', 'counterHora': '$counter'});
    }

    if (counter >= 17 && counter < 18) {
      yield SkyPhotoSunsetState(
          imageUrl: 'lib/asset/images/sunset.png',
          dataFromSuccessState: {'Mensagem': '', 'counterHora': '$counter'});
    }

    if (counter >= 18 && counter < 19) {
      yield SkyPhotoTwilightState(
          imageUrl: 'lib/asset/images/sunrise.png',
          dataFromSuccessState: {'Mensagem': '', 'counterHora': '$counter'});
    }

    if (counter >= 19 && counter < 23) {
      yield SkyPhotoEveningState(
          imageUrl: 'lib/asset/images/evening.png',
          dataFromSuccessState: {'Mensagem': '', 'counterHora': '$counter'});
    }

    if (counter >= 23 && counter < 24) {
      yield SkyPhotoMidnightState(
          imageUrl: 'lib/asset/images/midnight.png',
          dataFromSuccessState: {'Mensagem': '', 'counterHora': '$counter'});
    }
    if (counter >= 0 && counter < 5) {
      yield SkyPhotoNightState(
          imageUrl: 'lib/asset/images/night.png',
          dataFromSuccessState: {'Mensagem': '', 'counterHora': '$counter'});
    }

    if (counter >= 5 && counter < 6) {
      yield SkyPhotoDayLightState(
          imageUrl: 'lib/asset/images/daylight.png',
          dataFromSuccessState: {'Mensagem': '', 'counterHora': '$counter'});
    }
  }
}

//!=================================================
abstract class CounterHourEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CounterHourEventIncrement extends CounterHourEvent {
  CounterHourEventIncrement() : super();
}

class CounterHourEventDecrement extends CounterHourEvent {
  CounterHourEventDecrement() : super();
}

class CounterHourEventReset extends CounterHourEvent {
  CounterHourEventReset() : super();
}

//!=================================================
abstract class SkyPhotoState extends Equatable {
  final Map dataFromSuccessState;
  final String imageUrl;
  SkyPhotoState(this.dataFromSuccessState, this.imageUrl);
  @override
  List<Object> get props => [dataFromSuccessState, imageUrl];
}

//Start Inicial
class SkyPhotoInicialState extends SkyPhotoState {
  final Map dataFromSuccessState;
  final String imageUrl;

  SkyPhotoInicialState(
      {required this.imageUrl, required this.dataFromSuccessState})
      : super(dataFromSuccessState, imageUrl);
}

//day - retirado => Igual ao Morning

//Morning
class SkyPhotoMorningState extends SkyPhotoState {
  final Map dataFromSuccessState;
  final String imageUrl;

  SkyPhotoMorningState(
      {required this.imageUrl, required this.dataFromSuccessState})
      : super(dataFromSuccessState, imageUrl);
}
//Dawn - retirado => Igual ao Night

//sunrise/sunup
class SkyPhotoSunriseState extends SkyPhotoState {
  final Map dataFromSuccessState;
  final String imageUrl;

  SkyPhotoSunriseState(
      {required this.imageUrl, required this.dataFromSuccessState})
      : super(dataFromSuccessState, imageUrl);
}

//midday/ noon
class SkyPhotoMiddayState extends SkyPhotoState {
  final Map dataFromSuccessState;
  final String imageUrl;

  SkyPhotoMiddayState(
      {required this.imageUrl, required this.dataFromSuccessState})
      : super(dataFromSuccessState, imageUrl);
}

//afternoon
class SkyPhotoAfternoonState extends SkyPhotoState {
  final Map dataFromSuccessState;
  final String imageUrl;

  SkyPhotoAfternoonState(
      {required this.imageUrl, required this.dataFromSuccessState})
      : super(dataFromSuccessState, imageUrl);
}

//sunset
class SkyPhotoSunsetState extends SkyPhotoState {
  final Map dataFromSuccessState;
  final String imageUrl;

  SkyPhotoSunsetState(
      {required this.imageUrl, required this.dataFromSuccessState})
      : super(dataFromSuccessState, imageUrl);
}

//dusk/twilight
class SkyPhotoTwilightState extends SkyPhotoState {
  final Map dataFromSuccessState;
  final String imageUrl;

  SkyPhotoTwilightState(
      {required this.imageUrl, required this.dataFromSuccessState})
      : super(dataFromSuccessState, imageUrl);
}

//evening
class SkyPhotoEveningState extends SkyPhotoState {
  final Map dataFromSuccessState;
  final String imageUrl;

  SkyPhotoEveningState(
      {required this.imageUrl, required this.dataFromSuccessState})
      : super(dataFromSuccessState, imageUrl);
}

//night
class SkyPhotoNightState extends SkyPhotoState {
  final Map dataFromSuccessState;
  final String imageUrl;

  SkyPhotoNightState(
      {required this.imageUrl, required this.dataFromSuccessState})
      : super(dataFromSuccessState, imageUrl);
}

//midnight
class SkyPhotoMidnightState extends SkyPhotoState {
  final Map dataFromSuccessState;
  final String imageUrl;

  SkyPhotoMidnightState(
      {required this.imageUrl, required this.dataFromSuccessState})
      : super(dataFromSuccessState, imageUrl);
}

//daylight
class SkyPhotoDayLightState extends SkyPhotoState {
  final Map dataFromSuccessState;
  final String imageUrl;

  SkyPhotoDayLightState(
      {required this.imageUrl, required this.dataFromSuccessState})
      : super(dataFromSuccessState, imageUrl);
}

class SkyPhotoStateLoadingState extends SkyPhotoState {
  SkyPhotoStateLoadingState() : super({}, '');
}

class SkyPhotoStateErrorState extends SkyPhotoState {
  final String errorMessage;

  SkyPhotoStateErrorState({required this.errorMessage}) : super({}, '');
}
