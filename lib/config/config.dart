import 'package:prueba_tecnica_daniel_ramirez/config/environment.dart';
import 'package:prueba_tecnica_daniel_ramirez/config/service_locator.dart';

class Config {
  static void setup(BuildVariant buildVariant) {
    Environment.init(buildVariant);
    ServiceLocator.setup(Environment.instance);
  }
}
