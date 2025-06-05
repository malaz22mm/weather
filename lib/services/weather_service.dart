import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';
String key="7aa07a7c6dcc4126a3882137241912";
String base="https://api.weatherapi.com/v1";

class weatherService {
    Future<weatherModel?> getWeather({required String cityName}) async
    { weatherModel? weather;
        try
        {print("jjjjjjj");
          Uri url=Uri.parse("$base/forecast.json?key=$key&q=$cityName&days=1&aqi=no&alerts=no");
          http.Response r=await http.get(url);
          Map<String,dynamic> data =jsonDecode(r.body);
           weather=  weatherModel.fromJson(data);
           print("jeohjewhj");
        }
        catch(e)
      {
        print("the exp is::: $e");
      }
              return weather;
    }
    }