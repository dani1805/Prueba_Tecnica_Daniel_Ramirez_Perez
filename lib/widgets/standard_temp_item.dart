import 'package:flutter/material.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/data/entity/models/weather_response_model.dart';

class StandardTempItem extends StatelessWidget {
  const StandardTempItem({
    super.key,
    required this.weatherResponseModel,
    required this.title,
    required this.index,
  });

  final WeatherResponseModel weatherResponseModel;
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          color: weatherResponseModel.current.weather.first.color(),
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              color: weatherResponseModel.current.weather.first.color(),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),
          Image.network(
            width: 80,
            height: 80,
            'https://openweathermap.org/img/wn/${weatherResponseModel.daily.elementAt(index).weather.first.icon}@2x.png',
          ),
          SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.arrow_upward,
                    color: weatherResponseModel.current.weather.first.color(),
                  ),
                  Text(
                    '${weatherResponseModel.daily.elementAt(index).temp.max.toInt()}°C',
                    style: TextStyle(
                      fontSize: 15,
                      color: weatherResponseModel.current.weather.first.color(),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.arrow_downward,
                    color: weatherResponseModel.current.weather.first.color(),
                  ),
                  Text(
                    '${weatherResponseModel.daily.elementAt(index).temp.min.toInt()}°C',
                    style: TextStyle(
                      fontSize: 15,
                      color: weatherResponseModel.current.weather.first.color(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
