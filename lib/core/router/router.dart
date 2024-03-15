import 'package:faisal_starter_code_flutter/core/common/transitions/transitions.dart';
import 'package:faisal_starter_code_flutter/core/injection/injection.dart';
import 'package:faisal_starter_code_flutter/src/home/presentation/views/home_screen.dart';
import 'package:faisal_starter_code_flutter/src/users/presentation/bloc/users_bloc.dart';
import 'package:faisal_starter_code_flutter/src/users/presentation/views/users_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final routerConfig = GoRouter(
    initialLocation: HomeScreen.path,
    routes: [
      GoRoute(
        path: HomeScreen.path,
        name: HomeScreen.name,
        pageBuilder: (context, state) {
          return SlideUpRouteTransition(
            key: state.pageKey,
            child: const HomeScreen(),
          );
        },
      ),
      GoRoute(
        path: UsersScreen.path,
        name: UsersScreen.name,
        pageBuilder: (context, state) {
          return SlideRouteTransition(
            key: state.pageKey,
            child: BlocProvider(
              create: (context) => sl<UsersBloc>(),
              child: const UsersScreen(),
            ),
          );
        },
      ),
    ],
  );
}
