import 'dart:convert';

import 'package:weather_app/data/repository/get_weather_repo.dart';
import 'package:http/http.dart' as http;

class GetWeatherFromWeatherAPI implements GetWeatherRepo {
  @override
  Future<Map<String, Object>> getWeather(
      double latitude, double longitude) async {
    final url = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=37585363b15e4e62870203105213011&q=$latitude,$longitude&aqi=no');
    final response = await http.get(url);
    print(response.body);

    var mapFromJson = jsonDecode(response.body);
    return {};
  }
}

Future<Map<String, String>> consulta(String cepReceivedFromUser) async {
  final response = await http
      .get(Uri.parse('https://viacep.com.br/ws/$cepReceivedFromUser/json/'));
  //json.decode(response.body) as Map;
  print(response.body);

  var json2 = jsonDecode(response.body);

  Map<String, String> saida = {
    'cep': json2['cep'],
    'logradouro': json2['logradouro'],
    'complemento': json2['complemento'],
    'bairro': json2['bairro'],
    'localidade': json2['localidade'],
    'uf': json2['uf'],
    'ibge': json2['ibge'],
    'gia': json2['gia'],
    'ddd': json2['ddd'],
    'siafi': json2['siafi']
  };

  return Future.value(saida);
}
