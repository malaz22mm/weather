import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather/cubits/weather_cubit/weather_state.dart';
import 'package:weather/providers/weather_provider.dart';
import '../models/weather_model.dart';
import '../widgets/no_weather_body.dart';
import '../widgets/search_page.dart';
import '../widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});


  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return SearchPage();
            }));
          }, icon: const Icon(Icons.search))
        ],
        title: const Text('Weather App'),
      ),
      // body:Provider.of<weatherProvider>(context).weather==null? NoWeatherBody(): WeatherInfoBody(),
body: BlocBuilder<WeatherCubit,WeatherState>(builder: (context,state)
{  weatherModel? weatherData;

if(state is WeatherLoading)
  return Center(child: CircularProgressIndicator());
else if (state is WeatherSuccess)
  {weatherData= BlocProvider.of<WeatherCubit>(context).WeatherModel;
  return  WeatherInfoBody(weatherData: weatherData);
  }
else if (state is WeatherFailure) {
return NoWeatherBody();

}
else {
  return Center(
    child: Text('Malaaaaaaaaaaaaaaaaaz'),
  );
}
}

),
    );
  }
}
