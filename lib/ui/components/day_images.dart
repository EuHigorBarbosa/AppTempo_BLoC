import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/ui/pages/weather_hour_bloc.dart';

class DayTimesImage extends StatefulWidget {
  const DayTimesImage({Key? key}) : super(key: key);

  @override
  _DayTimesImageState createState() => _DayTimesImageState();
}

class _DayTimesImageState extends State<DayTimesImage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SkyPhotoHourBloc, SkyPhotoState>(
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
                height: 200,
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
    );
  }
}
