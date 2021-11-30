import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/ui/components/day_images.dart';
import 'package:weather_app/ui/components/location_imput.dart';
import 'package:weather_app/ui/components/day_images_bloc.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Weather App'),
      ),
      body: Column(
        children: [
          DayTimesImage(),
          LocationInput(),
        ],
      ),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
//context.read<MyFormBloc>().add(EmailChangedEvent(email: value));