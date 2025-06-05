import 'package:flutter/material.dart';

class weatherModel{
   String date;
   double temp;
   double minTemp;
   double maxTemp;
   String weatherState;

  weatherModel({required this.date, required this.temp, required this.minTemp,
    required this.maxTemp, required this.weatherState});

  factory weatherModel.fromJson(dynamic data)
  {
    var jsonData=data['forecast']['forecastday'][0]['day'];
    return weatherModel(
        date: data['location']['localtime'],
        temp: jsonData['avgtemp_c'],
    minTemp: jsonData['mintemp_c'],
    maxTemp: jsonData['maxtemp_c'],
  weatherState: jsonData['condition']['text']);

  }
String getImage()
{
    if(weatherState=='Clear'||weatherState=='Light Cloud') {
      return 'assets/images/clear.png';
    } else if (weatherState=='Sleet'||weatherState=='Snow'||weatherState=='Hail')
      return 'assets/images/snow.png';
    else if (weatherState=='Heavy Cloud'||weatherState=='Partly Cloudy ')
      return 'assets/images/cloudy.png';
    else if (weatherState=='Heavy Rain'||weatherState=='Light Rain'||weatherState=='Showers'||weatherState=='Patchy rain nearby'||weatherState=='Moderate rain')
      return 'assets/images/rainy.png';
    else if (weatherState=='Thunderstorm')
      return "assets/images/thunderstorm.png";
    else {
      return 'assets/images/clear.png';
    }

}
   MaterialColor getTheme() {
     if (weatherState == 'Clear' || weatherState == 'Light Cloud') {
       return Colors.orange;
     } else if (weatherState == 'Sleet' || weatherState == 'Snow' ||
         weatherState == 'Hail')
       return Colors.blue;
     else if (weatherState == 'Heavy Cloud'||weatherState=='Partly Cloudy ')
       return Colors.grey;
     else if (weatherState == 'Heavy Rain' || weatherState == 'Light Rain' ||
         weatherState == 'Showers'||weatherState=='Patchy rain nearby'||weatherState=='Moderate rain'||weatherState=='Moderate rain ')
       return Colors.blueGrey;
     else if (weatherState == 'Thunderstorm')
       return Colors.grey;
     else {
       return Colors.orange;
     }
   }}