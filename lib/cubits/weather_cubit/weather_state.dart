import 'package:weather/models/weather_model.dart';

import '../../models/weather_model.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState{}
class WeatherLoading extends WeatherState
{

}
class WeatherSuccess extends WeatherState
{

weatherModel WeatherModel;
WeatherSuccess({required this.WeatherModel});
}
class WeatherFailure extends WeatherState
{

}