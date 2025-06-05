import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/services/weather_service.dart';
import 'package:weather/views/home_view.dart';
import 'cubits/weather_cubit/weather_cubit.dart';

void main() {
  runApp( BlocProvider(create: (context){
    return WeatherCubit( weatherService());

  },child: const WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme:ThemeData(
          primarySwatch: BlocProvider.of<WeatherCubit>(context).WeatherModel==null ? Colors.blue :BlocProvider.of<WeatherCubit>(context).WeatherModel!.getTheme()
      ) ,
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
