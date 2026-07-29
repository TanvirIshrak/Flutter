import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../model/weather_model.dart';
class WeatherCard extends StatelessWidget {
  final Weather weather;
  const WeatherCard({super.key, required this.weather});

  String formatTime(int timestemp){
    final date = DateTime.fromMillisecondsSinceEpoch(timestemp * 1000, isUtc: true);
    return DateFormat('hh:mm a').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(14),
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20)
          ),

          child: Column(
            mainAxisAlignment: .start,
            children: [

              // display weather animation
              Lottie.asset(
                weather.description.contains('rain')?
                    "assets/rain.json"
                : weather.description.contains('clear')?
                    "assets/sunny.json"
                : 'assets/cloudy.json',


                height: 150,
                width: 150
              ),

              // display text
              Text(
                weather.cityName,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 10,),

              Text(
                "${weather.tempreture.toStringAsFixed(1)}°C",
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: .bold
                ),
              ),
              SizedBox(height: 10,),

              Text(
                weather.description,
                style: Theme.of(context).textTheme.titleMedium
              ),

              SizedBox(height:20),

              Row(
                mainAxisAlignment: .spaceEvenly,
                children: [
                  Text(
                    'Humidity: ${weather.humidity}%',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'Wind: ${weather.windSpeed} m/s',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              SizedBox(height:20),

              Row(
                mainAxisAlignment: .spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.wb_sunny_outlined, color: Colors.orangeAccent,),
                      Text(
                        'Sunrise',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        formatTime(weather.sunrise),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      Icon(Icons.nights_stay_outlined, color: Colors.deepPurple,),
                      Text(
                        'Sunset',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        formatTime(weather.sunset),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  )
                ],
              )

            ],
          ),
        ),
      ],
    );
  }
}
