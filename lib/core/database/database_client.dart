import 'package:injectable/injectable.dart';
import 'package:sfb/core/config/env.dart';
import 'package:sfb/core/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Initializes the Supabase client with the provided environment configuration.
Future<void> initDatabase() async {
  Log.t('Initializing Supabase client');
  await Supabase.initialize(url: Env.supabaseUrl, anonKey: Env.supabasePubKey);
}

/// Provides the SupabaseClient instance for dependency injection.
@module
abstract class DatabaseClient {
  SupabaseClient get client => Supabase.instance.client;
}
