import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/providers/weather_provider.dart';
import 'package:weather/services/weather_service.dart';
class SearchPage extends StatelessWidget {
String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text("Search a city"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            onSubmitted: (data)async{
              cityName=data;
            BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityName!);
              BlocProvider.of<WeatherCubit>(context).cityName=cityName;
           Navigator.pop(context);
            },
            decoration: const InputDecoration(
              label: Text("search"),
              contentPadding: EdgeInsets.symmetric(vertical: 32,horizontal: 24),
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.search),
              hintText: "Enter a city",

            ),
          ),
        ),
      ),
    );
  }
}
