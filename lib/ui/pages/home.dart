import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/ui/pages/weather_hour_bloc.dart';

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

      // BlocBuilder(
      //       bloc: BlocProvider.of<SkyPhotoHourBloc>(context),
      //       builder: (context, state) {
      //         if(state is SkyPhotoInicialState)
      //         return Home();
      //       },
      //     ),
      body: BlocBuilder<SkyPhotoHourBloc, SkyPhotoState>(
        bloc: BlocProvider.of<SkyPhotoHourBloc>(context),
        builder: (context, state) {
          print('RunTime State: ${state.runtimeType}');
          print('Content inside State: ${state.dataFromSuccessState}');

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                    'Quando está na hora ${state.dataFromSuccessState['counterHora']} seu dia está igual ...'),
                Image.asset(
                  state.imageUrl,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        BlocProvider.of<SkyPhotoHourBloc>(context)
                            .add(CounterHourEventIncrement());
                      },
                      child: const Icon(Icons.add),
                    ),
                    TextButton(
                      onPressed: () {
                        BlocProvider.of<SkyPhotoHourBloc>(context)
                            .add(CounterHourEventDecrement());
                      },
                      child: const Icon(Icons.remove),
                    ),
                    TextButton(
                      onPressed: () {
                        BlocProvider.of<SkyPhotoHourBloc>(context)
                            .add(CounterHourEventReset());
                      },
                      child: const Icon(Icons.reply_all_outlined),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
//context.read<MyFormBloc>().add(EmailChangedEvent(email: value));