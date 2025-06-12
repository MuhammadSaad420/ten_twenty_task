import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'APIKey', obfuscate: true)
  static String apiKey = _Env.apiKey;
}
