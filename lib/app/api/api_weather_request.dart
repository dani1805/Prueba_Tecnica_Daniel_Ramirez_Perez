import 'package:dio/dio.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/data/entity/server/standard_message_error.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/data/entity/server/weather_response_server_model.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/helpers/exception.dart';
import 'package:prueba_tecnica_daniel_ramirez/config/service_locator.dart';

abstract class ApiWeatherRequestImpl {
  factory ApiWeatherRequestImpl() => ApiWeatherRequest();
  Future<WeatherResponseServerModel> getWeather(double lat, double lon);
}

class ApiWeatherRequest implements ApiWeatherRequestImpl {
  final dio = getIt<Dio>();

  @override
  Future<WeatherResponseServerModel> getWeather(double lat, double lon) async {
    try {
      final response = await dio.get(
        'onecall?lat=$lat&lon=$lon&appid=e1e1c2623e69bff2a4da4bbddc049de6&exclude=minutely&units=metric&lang=sp',
      );

      if (response.statusCode == 200) {
        final weather = WeatherResponseServerModel.fromJson(response.data);
        return weather;
      } else {
        final error = StandardMessageError.fromJson(response.data);
        throw MException(code: response.statusCode!, message: error.message);
      }
    } on DioError {
      throw MException(code: 600, message: 'network-error');
    } on TypeError {
      throw MException(code: 500, message: 'general-error');
    }
  }
}
