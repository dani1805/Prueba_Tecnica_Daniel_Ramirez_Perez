import 'package:flutter/widgets.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/data/entity/models/weather_response_model.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key, required this.weatherResponseModel});

  final WeatherResponseModel weatherResponseModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          weatherResponseModel.current.weather.isNotEmpty
              ? Text(weatherResponseModel.current.weather.first.description)
              : const SizedBox.shrink(),
    );
  }
}
