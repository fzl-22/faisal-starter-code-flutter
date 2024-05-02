import 'package:faisal_starter_code_flutter/core/injection/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final sl = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: false,
  usesNullSafety: true,
)
Future<void> initDependencies() async => sl.init();
