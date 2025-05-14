// ignore_for_file: sort_constructors_first

class MException implements Exception {
  String message;
  int code;

  MException({required this.code, required this.message});
}
