import 'dart:convert';

StandardMessageError messageErrorFromJson(String str) =>
    StandardMessageError.fromJson(json.decode(str));

String messageErrorToJson(StandardMessageError data) =>
    json.encode(data.toJson());

class StandardMessageError {
  StandardMessageError({required this.cod, required this.message});

  String cod;
  String message;

  factory StandardMessageError.fromJson(Map<String, dynamic> json) =>
      StandardMessageError(cod: json['cod'], message: json['message']);

  Map<String, dynamic> toJson() => {'cod': cod, 'message': message};
}
