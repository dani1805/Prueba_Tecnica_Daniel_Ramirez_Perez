class TempServerModel {
  TempServerModel({this.day, this.max, this.min});

  double? day;
  double? max;
  double? min;

  factory TempServerModel.fromJson(Map<String, dynamic> json) =>
      TempServerModel(day: json['day'], max: json['max'], min: json['min']);
}
