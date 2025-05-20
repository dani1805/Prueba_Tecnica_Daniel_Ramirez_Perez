import 'package:prueba_tecnica_daniel_ramirez/app/api/api_weather_request.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/data/entity/models/weather_response_model.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/domain/weather_repository_impl.dart';

class WeatherRepository extends WeatherRepositoryImpl {
  WeatherRepository();

  final apiWeatherRepository = ApiWeatherRequestImpl();

  @override
  Future<WeatherResponseModel> getWeather(
    double lat,
    double lon,
    String lang,
  ) async {
    final weatherResponseServerModel = await apiWeatherRepository.getWeather(
      lat,
      lon,
      lang,
    );
    final weatherResponseModel = WeatherResponseModel.fromServer(
      weatherResponseServerModel,
    );

    return weatherResponseModel;
  }
}
