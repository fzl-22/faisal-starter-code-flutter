import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:faisal_starter_code_flutter/core/injection/injection.dart';
import 'package:faisal_starter_code_flutter/core/utils/logger.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();
  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    AppLogger.debug('onEvent(${bloc.runtimeType}, $event)');
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    AppLogger.debug('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    AppLogger.error('onError(${bloc.runtimeType}, $error, $stackTrace)');
  }
}


Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  // loads environment variables
  await dotenv.load();

  // initializes dependencies
  await initDependencies();

  // Add cross-flavor configuration here
  // ...

  runApp(await builder());
}
