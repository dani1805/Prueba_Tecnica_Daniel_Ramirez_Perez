import 'package:prueba_tecnica_daniel_ramirez/app/data/entity/server/weather_server_model.dart';

class CurrentServerModel {
  CurrentServerModel({this.temp, this.windSpeed, this.uvi, this.weather});

  dynamic temp;
  dynamic windSpeed;
  dynamic uvi;
  List<WeatherServerModel>? weather;

  factory CurrentServerModel.fromJson(Map<String, dynamic> json) =>
      CurrentServerModel(
        temp: json['temp'],
        windSpeed: json['wind_speed'],
        uvi: json['uvi'],
        weather:
            json['weather'] != null
                ? List<WeatherServerModel>.from(
                  json['weather'].map((x) => WeatherServerModel.fromJson(x)),
                )
                : null,
      );
}
