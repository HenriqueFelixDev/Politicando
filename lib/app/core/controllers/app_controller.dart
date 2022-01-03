enum AppState {
  none, loading, state, error
}

abstract class AppController {
  AppState state = AppState.none;
  String? error;
}