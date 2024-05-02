part of 'router.dart';

/// [RouterObserver]
///
/// Used in [AppRouter.routerConfig] for navigation logging.
class RouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    AppLogger.debug('[RouterObserver] didPush: $route');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    AppLogger.debug('[RouterObserver] didPop: $route');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    AppLogger.debug('[RouterObserver] didRemove: $route');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    AppLogger.debug('[RouterObserver] didReplace: $newRoute');
  }
}
