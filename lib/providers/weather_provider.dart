
import 'package:flutter/cupertino.dart';
import 'package:weather/models/weather_model.dart';

class weatherProvider extends ChangeNotifier {
  weatherModel? _weather;
  String? cityName;
  set weather(weatherModel? ww) {
    _weather=ww;
    notifyListeners();
  }
  weatherModel? get  weather=>_weather;
}