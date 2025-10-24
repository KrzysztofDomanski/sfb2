import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'dependency_injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit(initializerName: 'init')
void configureDependencies() => getIt.init();
