import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum InternetConnectionState {
  none, wifi, mobile
}

class ConnectionController {
  final _connectivity = Connectivity();

  final ValueNotifier<InternetConnectionState> connectionState = ValueNotifier(InternetConnectionState.none);

  ConnectionController() {
    _connectivity.onConnectivityChanged.listen((result) {
      const connectionStatesMap = {
        ConnectivityResult.none: InternetConnectionState.none,
        ConnectivityResult.wifi: InternetConnectionState.wifi,
        ConnectivityResult.mobile: InternetConnectionState.mobile
      };

      connectionState.value = connectionStatesMap[result]!;
    });
  }
}