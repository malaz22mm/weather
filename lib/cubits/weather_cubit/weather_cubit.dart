import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/weather_cubit/weather_state.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_service.dart';


class WeatherCubit extends Cubit<WeatherState>{
  weatherService WeatherService;
  String? cityName;
  weatherModel? WeatherModel;
  WeatherCubit(this.WeatherService):super(WeatherInitial());

    void getWeather({required String cityName }) async{
    emit(WeatherLoading());
     try {
      WeatherModel= await WeatherService.getWeather(cityName: cityName);
       emit(WeatherSuccess());
     } on Exception catch (e) {
       emit(WeatherFailure());

     }
    }

}