import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/ui/pages/home.dart';
import 'package:weather_app/ui/pages/weather_hour_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider<SkyPhotoHourBloc>(
              create: (context) => SkyPhotoHourBloc(SkyPhotoInicialState(
                  dataFromSuccessState: {},
                  imageUrl: 'lib/asset/images/inicial.png')),
            ),
          ],
          child: Home(),
        ));
  }
}
