// ignore_for_file: sort_constructors_first, lines_longer_than_80_chars, curly_braces_in_flow_control_structures

enum BuildVariant { dev, pro }

class Environment {
  late final BuildVariant _buildVariant;
  static Environment? _instance;

  late String baseUrl;

  Environment.internal(BuildVariant buildVariant) {
    _buildVariant = buildVariant;

    switch (_buildVariant) {
      case BuildVariant.dev:
        baseUrl = 'https://api.openweathermap.org/data/3.0/';
        break;
      case BuildVariant.pro:
        baseUrl = 'https://api.openweathermap.org/data/3.0/';
        break;
    }
  }

  factory Environment.init(BuildVariant buildVariant) {
    _instance = Environment.internal(buildVariant);
    return _instance!;
  }

  static Environment get instance {
    if (_instance == null)
      throw Exception('You should init Environment before get instance');
    return _instance!;
  }

  BuildVariant get buildVariant => _buildVariant;
}
