import 'package:prueba_tecnica_daniel_ramirez/app/data/entity/server/current_server_model.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/data/entity/server/daily_server_model.dart';

class WeatherResponseServerModel {
  WeatherResponseServerModel({this.current, this.daily});

  CurrentServerModel? current;
  List<DailyServerModel>? daily;

  factory WeatherResponseServerModel.fromJson(Map<String, dynamic> json) =>
      WeatherResponseServerModel(
        current:
            json['current'] != null
                ? CurrentServerModel.fromJson(json['current'])
                : null,
        daily:
            json['daily'] != null
                ? List<DailyServerModel>.from(
                  json['daily'].map((x) => DailyServerModel.fromJson(x)),
                )
                : null,
      );
}
