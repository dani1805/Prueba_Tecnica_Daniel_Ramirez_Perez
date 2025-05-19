import 'package:prueba_tecnica_daniel_ramirez/app/data/entity/server/weather_server_model.dart';

class WeatherModel {
  WeatherModel({required this.icon, required this.description});

  String icon;
  String description;

  factory WeatherModel.fromServer(WeatherServerModel serverModel) =>
      WeatherModel(
        icon: serverModel.icon ?? '',
        description: serverModel.description ?? '',
      );
}
