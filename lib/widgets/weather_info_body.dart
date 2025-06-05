import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather/models/weather_model.dart';

import '../cubits/weather_cubit/weather_cubit.dart';

class WeatherInfoBody extends StatelessWidget {
  final weatherModel? weatherData;

  const WeatherInfoBody({Key? key, required this.weatherData}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    if (weatherData == null) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text("Loading weather data..."),
          ],
        ),
      );
    }


    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                weatherData!.getTheme(),
                weatherData!.getTheme()[300]!,
                weatherData!.getTheme()[100]!
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(

              BlocProvider.of<WeatherCubit>(context).cityName ?? 'Loading City...',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              'updated at: ${weatherData!.date.toString()}',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(weatherData!.getImage()),
                Text(
                  weatherData!.temp.toInt().toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Maxtemp: ${weatherData!.maxTemp.toInt()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Mintemp: ${weatherData!.minTemp.toInt()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weatherData!.weatherState,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}