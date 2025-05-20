import 'package:prueba_tecnica_daniel_ramirez/app/data/entity/models/temp_model.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/data/entity/models/weather_model.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/data/entity/server/daily_server_model.dart';

class DailyModel {
  DailyModel({
    required this.weather,
    required this.temp,
    required this.summary,
  });

  List<WeatherModel> weather;
  TempModel temp;
  String summary;

  factory DailyModel.fromServer(DailyServerModel serverModel) => DailyModel(
    weather:
        serverModel.weather != null
            ? List<WeatherModel>.from(
              serverModel.weather!.map((x) => WeatherModel.fromServer(x)),
            )
            : [],

    temp:
        serverModel.temp != null
            ? TempModel.fromServer(serverModel.temp!)
            : TempModel(day: 0, max: 0, min: 0),
    summary: serverModel.summary ?? '',
  );
}
