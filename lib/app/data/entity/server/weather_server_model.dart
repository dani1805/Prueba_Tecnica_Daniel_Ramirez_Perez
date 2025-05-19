class WeatherServerModel {
  WeatherServerModel({this.icon, this.description});

  String? icon;
  String? description;

  factory WeatherServerModel.fromJson(Map<String, dynamic> json) =>
      WeatherServerModel(icon: json['icon'], description: json['description']);
}
