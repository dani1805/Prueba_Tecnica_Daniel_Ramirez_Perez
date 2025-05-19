import 'package:prueba_tecnica_daniel_ramirez/app/data/entity/models/current_model.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/data/entity/models/daily_model.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/data/entity/server/weather_response_server_model.dart';

class WeatherResponseModel {
  WeatherResponseModel({required this.current, required this.daily});

  CurrentModel current;
  List<DailyModel> daily;

  factory WeatherResponseModel.fromServer(
    WeatherResponseServerModel serverModel,
  ) => WeatherResponseModel(
    current:
        serverModel.current != null
            ? CurrentModel.fromServer(serverModel.current!)
            : CurrentModel(temp: 0, weather: []),
    daily:
        serverModel.daily != null
            ? List<DailyModel>.from(
              serverModel.daily!.map((x) => DailyModel.fromServer(x)),
            )
            : [],
  );
}
