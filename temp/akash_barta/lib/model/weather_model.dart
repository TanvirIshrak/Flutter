class Weather{
  final String cityName;
  final double tempreture;
  final String description;
  final int humidity;
  final double windSpeed;
  final int sunrise;
  final int sunset;

  Weather({
    required this.cityName,
    required this.tempreture,
    required this.description,
    required this.humidity,
    required this.sunrise,
    required this.sunset,
    required this.windSpeed,});


  factory Weather.fromJson(Map<String , dynamic> json){
    return Weather(
        cityName: json['name'],
        tempreture: json['main']['temp'] - 273,  // kelvin to celcius
        description: json['weather'][0]['description'],
        humidity: json['main']['humidity'],
        sunrise: json['sys']['sunrise'],
        sunset: json['sys']['sunset'],
        windSpeed: json['wind']['speed']);
  }
}