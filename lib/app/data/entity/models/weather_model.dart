import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/data/entity/server/weather_server_model.dart';
import 'package:prueba_tecnica_daniel_ramirez/app/helpers/colors.dart';

class WeatherModel {
  WeatherModel({required this.icon, required this.description});

  String icon;
  String description;

  factory WeatherModel.fromServer(WeatherServerModel serverModel) =>
      WeatherModel(
        icon: serverModel.icon ?? '',
        description: serverModel.description ?? '',
      );

  List<Color> linearGradient() {
    switch (icon) {
      case '01d':
      case '01n':
      case '02d':
      case '02n':
        return MColor.clear;
      case '04d':
      case '04n':
      case '09d':
      case '09n':
      case '11d':
      case '11n':
        return MColor.rainy;
      default:
        return MColor.cloudy;
    }
  }

  Color color() {
    switch (icon) {
      case '01d':
      case '01n':
      case '02d':
      case '02n':
      case '04d':
      case '04n':
      case '09d':
      case '09n':
      case '11d':
      case '11n':
        return Colors.white;
      default:
        return Colors.black;
    }
  }
}
