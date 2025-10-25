import 'package:envied/envied.dart';

part 'env.g.dart';

/// Configuration class for environment variables.
@Envied(requireEnvFile: true)
abstract class Env {
  /// Supabase project URL.
  @EnviedField(obfuscate: true, varName: 'SUPABASE_URL')
  static final String supabaseUrl = _Env.supabaseUrl;

  /// Supabase project publishable key.
  @EnviedField(obfuscate: true, varName: 'SUPABASE_PUB_KEY')
  static final String supabasePubKey = _Env.supabasePubKey;
}
