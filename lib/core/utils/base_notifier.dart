import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class BaseNotifier extends ChangeNotifier {
  bool isConnected = true;

  BaseNotifier() {
    debugPrint("Base Notifier");
    checkConnectionState();
  }

  Future<void> checkConnectionState() async {
    isConnected = await InternetConnectionChecker().hasConnection;
    notifyListeners();
    Connectivity().onConnectivityChanged.listen((status) async {
      isConnected = await InternetConnectionChecker().hasConnection;
      notifyListeners();
    });
  }
}
