import 'package:prueba_tecnica_daniel_ramirez/app/data/entity/models/weather_model.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/data/entity/server/current_server_model.dart';

class CurrentModel {
  CurrentModel({required this.temp, required this.weather});

  double temp;
  List<WeatherModel> weather;

  factory CurrentModel.fromServer(CurrentServerModel serverModel) =>
      CurrentModel(
        temp: serverModel.temp ?? 0,
        weather:
            serverModel.weather != null
                ? List<WeatherModel>.from(
                  serverModel.weather!.map((x) => WeatherModel.fromServer(x)),
                )
                : [],
      );
}
