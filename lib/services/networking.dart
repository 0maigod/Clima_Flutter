import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

var jsonNull = """{"coord":{"lon":145.77,"lat":-16.92},"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03n"}],"base":"stations","main":{"temp":273,"pressure":1007,"humidity":74,"temp_min":300.15,"temp_max":300.15},"visibility":10000,"wind":{"speed":3.6,"deg":160},"clouds":{"all":40},"dt":1485790200,"sys":{"type":1,"id":8166,"message":0.2064,"country":"AU","sunrise":1485720272,"sunset":1485766550},"id":2172797,"name":"Nowhere","cod":200}""";

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async{

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      print(response.body);

     return jsonDecode(data);

    }else{
      print('no nos podemos comunicar');
      print(response.statusCode);
      return jsonDecode(jsonNull);
    }
  }
}