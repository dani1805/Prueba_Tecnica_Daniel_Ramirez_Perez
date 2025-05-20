import 'package:prueba_tecnica_daniel_ramirez/app/data/entity/server/temp_server_model.dart';

class TempModel {
  TempModel({required this.day, required this.max, required this.min});

  dynamic day;
  dynamic max;
  dynamic min;

  factory TempModel.fromServer(TempServerModel serverModel) => TempModel(
    day: serverModel.day ?? 0,
    max: serverModel.max ?? 0,
    min: serverModel.min ?? 0,
  );
}
