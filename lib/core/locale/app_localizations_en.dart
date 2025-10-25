// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get welcome => 'Welcome!';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get signUp => 'Sign Up';

  @override
  String get alreadyHaveAnAccount => 'Already have an account?';

  @override
  String get signIn => 'Sign In';

  @override
  String get dontHaveAnAccountYet => 'Don\'\'t have an account yet?';
}
