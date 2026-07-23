import 'package:flutter/material.dart';
import 'package:weather_app_project/services/weather_services.dart';
import 'package:weather_app_project/widget/weather_card.dart';

import '../model/weather_model.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final WeatherServices _weatherServices = WeatherServices();
  final TextEditingController _controller = TextEditingController();

  bool _isLoading = false;
  Weather? _weather;

  void _getWeather() async{
    setState(() {
      _isLoading = true;
    });

    try{
      final weather = await _weatherServices.freatchWeather(_controller.text);
      setState(() {
        _weather = weather;
        _isLoading = false;
      });
    }catch (e){
      print(e);

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString()))
      );

      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: (_weather != null && _weather!.description.toLowerCase().contains('rain'))
              ? const LinearGradient(
                colors: [
                  Colors.grey,
                  Colors.blueAccent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )

              : (_weather != null && _weather!.description.toLowerCase().contains('clear'))
              ? const LinearGradient(
                colors: [
                  Color(0xFFFFB347),
                  Color(0xFF4FC3F7),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )

              : (_weather != null && (_weather!.description.toLowerCase().contains('cloud') ||
                  _weather!.description.toLowerCase().contains('overcast')))
              ? const LinearGradient(
                colors: [
                  Color(0xFF757F9A),
                  Color(0xFFD7DDE8),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )

              : (_weather != null && (_weather!.description.toLowerCase().contains('snow') ||
                  _weather!.description.toLowerCase().contains('cold')))
              ? const LinearGradient(
                colors: [
                  Color(0xFFB2FEFA),
                  Color(0xFF0ED2F7),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )

              : (_weather != null && (_weather!.description.toLowerCase().contains('hot') ||
                  _weather!.description.toLowerCase().contains('warm')))
              ? const LinearGradient(
                colors: [
                  Color(0xFFFF512F),
                  Color(0xFFF09819),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )

              : const LinearGradient(
                colors: [
                  Color(0xFF89F7FE),
                  Color(0xFF66A6FF),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),

        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 25,),
                Text("Weather App",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: .bold,
                    color: Colors.black
                  ),
                ),

                SizedBox(height: 25),
                TextField(
                  controller: _controller,
                  style: TextStyle(color:Colors.black),
                  decoration: InputDecoration(
                    labelText: 'City',
                    hintText: 'Enter your city',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.3)
                  ),
                ),
                SizedBox(height: 30,),

                SizedBox(
                  height: 60,
                  width: 255,
                  child: ElevatedButton(
                      onPressed: _getWeather,
                      child: Text("Get weathe",style: TextStyle(fontSize: 20),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.1),
                        foregroundColor: Colors.white.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(30)
                        )
                      ),
                  ),
                ),

                if(_isLoading)
                  Padding(padding: EdgeInsetsGeometry.all(20),
                    child: CircularProgressIndicator(color: Colors.white,),
                  ),

                if(_weather!=null)
                  WeatherCard(weather: _weather!,)

              ],
            ),
          ),
        ),
      )
    );


  }
}
