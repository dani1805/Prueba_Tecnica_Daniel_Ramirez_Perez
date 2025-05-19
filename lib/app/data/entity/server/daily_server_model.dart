import 'package:prueba_tecnica_daniel_ramirez/app/data/entity/server/temp_server_model.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/data/entity/server/weather_server_model.dart';

class DailyServerModel {
  DailyServerModel({this.weather, this.temp});

  List<WeatherServerModel>? weather;
  TempServerModel? temp;

  factory DailyServerModel.fromJson(
    Map<String, dynamic> json,
  ) => DailyServerModel(
    weather:
        json['weather'] != null
            ? List<WeatherServerModel>.from(
              json['weather'].map((x) => WeatherServerModel.fromJson(x)),
            )
            : null,
    temp: json['temp'] != null ? TempServerModel.fromJson(json['temp']) : null,
  );
}
