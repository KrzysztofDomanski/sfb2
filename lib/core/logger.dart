import 'package:logger/logger.dart';

abstract class Log {
  static final _logger = Logger(printer: PrettyPrinter(methodCount: 0));

  /// Log a verbose message.
  static void t(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.t(message, error: error, stackTrace: stackTrace);
  }

  /// Log an error message.
  static void e(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  /// Log an info message.
  static void i(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.i(message, error: error, stackTrace: stackTrace);
  }

  /// Log a debug message.
  static void d(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.d(message, error: error, stackTrace: stackTrace);
  }

  /// Log a fatal message.
  static void f(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.f(message, error: error, stackTrace: stackTrace);
  }
}
