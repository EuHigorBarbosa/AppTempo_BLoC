import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:weather_app/ui/components/location_bloc.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(
            width: 1,
            color: Colors.grey,
          )),
          child: BlocBuilder<GetLocationBloc, GetLocationState>(
              bloc: BlocProvider.of<GetLocationBloc>(context),
              builder: (context, state) {
                print('RunTime State: ${state.runtimeType}');
                print('Content inside State: ${state.imageMapUrlSuper}');

                return state.imageMapUrlSuper == ''
                    ? const Text('Localização não informada')
                    : Image.network(
                        state.imageMapUrlSuper,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      );
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                child: Row(
                  children: [
                    Icon(Icons.location_on),
                    Text(
                      'Clique para obter\n o clima daqui',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                onPressed: () => BlocProvider.of<GetLocationBloc>(context)
                    .add(GetLocationFromHereEvent()),
              ),
              ElevatedButton(
                child: Row(
                  children: [
                    Icon(Icons.location_on),
                    Text(
                      'Clima do ponto\n escolhido no mapa',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}
