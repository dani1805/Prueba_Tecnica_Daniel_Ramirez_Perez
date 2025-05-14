// ignore_for_file: sort_constructors_first, lines_longer_than_80_chars

enum BuildVariant {
  dev,
  pro,
}

class Environment {
  late final BuildVariant _buildVariant;
  static Environment? _instance;

  late String baseUrl;

  Environment.internal(BuildVariant buildVariant) {
    _buildVariant = buildVariant;

    switch (_buildVariant) {
      case BuildVariant.dev:
        baseUrl = '';
        break;
      case BuildVariant.pro:
        baseUrl = '';
        break;
    }
  }

  factory Environment.init(BuildVariant buildVariant) {
    _instance = Environment.internal(buildVariant);
    return _instance!;
  }

  static Environment get instance {
    if (_instance == null) throw Exception('You should init Environment before get instance');
    return _instance!;
  }

  BuildVariant get buildVariant => _buildVariant;
}
