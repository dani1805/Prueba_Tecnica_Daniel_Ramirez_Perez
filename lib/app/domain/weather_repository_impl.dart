import 'package:prueba_tecnica_daniel_ramirez/app/data/entity/models/weather_response_model.dart';

abstract class WeatherRepositoryImpl {
  Future<WeatherResponseModel> getWeather(double lat, double lon);
}
