import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/data/entity/models/weather_response_model.dart';
import 'package:prueba_tecnica_daniel_ramirez/widgets/standard_temp_item.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key, required this.weatherResponseModel});

  final WeatherResponseModel weatherResponseModel;

  @override
  Widget build(BuildContext context) {
    return weatherResponseModel.current.weather.isNotEmpty
        ? Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(1, 1),
              colors:
                  weatherResponseModel.current.weather.first.linearGradient(),
              tileMode: TileMode.mirror,
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${DateFormat('d MMM').format(DateTime.now())} | ${DateFormat('HH:mm').format(DateTime.now())}',
                  style: TextStyle(
                    fontSize: 15,
                    color: weatherResponseModel.current.weather.first.color(),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.sunny,
                              color:
                                  weatherResponseModel.current.weather.first
                                      .color(),
                            ),
                            Text(
                              '${weatherResponseModel.current.uvi.toInt()} UV',
                              style: TextStyle(
                                fontSize: 15,
                                color:
                                    weatherResponseModel.current.weather.first
                                        .color(),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_right_alt,
                              color:
                                  weatherResponseModel.current.weather.first
                                      .color(),
                            ),
                            Text(
                              '${weatherResponseModel.current.windSpeed.toInt()} km/h',
                              style: TextStyle(
                                fontSize: 15,
                                color:
                                    weatherResponseModel.current.weather.first
                                        .color(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '${weatherResponseModel.current.temp.toInt()}°C',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color:
                                weatherResponseModel.current.weather.first
                                    .color(),
                          ),
                        ),
                        Image.network(
                          width: 80,
                          height: 80,
                          'https://openweathermap.org/img/wn/${weatherResponseModel.current.weather.first.icon}@2x.png',
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_upward,
                              color:
                                  weatherResponseModel.current.weather.first
                                      .color(),
                            ),
                            Text(
                              '${weatherResponseModel.daily.first.temp.max.toInt()}°C',
                              style: TextStyle(
                                fontSize: 15,
                                color:
                                    weatherResponseModel.current.weather.first
                                        .color(),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_downward,
                              color:
                                  weatherResponseModel.current.weather.first
                                      .color(),
                            ),
                            Text(
                              '${weatherResponseModel.daily.first.temp.min.toInt()}°C',
                              style: TextStyle(
                                fontSize: 15,
                                color:
                                    weatherResponseModel.current.weather.first
                                        .color(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  weatherResponseModel.daily.first.summary,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: weatherResponseModel.current.weather.first.color(),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StandardTempItem(
                      weatherResponseModel: weatherResponseModel,
                      title: 'weather-screen.morning'.tr(),
                      index: 1,
                    ),
                    StandardTempItem(
                      weatherResponseModel: weatherResponseModel,
                      title: DateFormat(
                        'd MMM',
                      ).format(DateTime.now().add(const Duration(days: 2))),
                      index: 2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
        : const SizedBox.shrink();
  }
}
