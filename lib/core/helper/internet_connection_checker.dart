import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class InternetChecker {
  final Connectivity _connectivity = Connectivity();
  bool _isConnected = true; // Assume initially connected

  void monitorConnection(BuildContext context) {
    _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      bool isConnected = results.contains(ConnectivityResult.mobile) ||
          results.contains(ConnectivityResult.wifi);

      if (isConnected != _isConnected) {
        _isConnected = isConnected;
        showConnectionStatus(context, _isConnected);
      }
    });
  }

  void showConnectionStatus(BuildContext context, bool isConnected) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isConnected ? "You are Live! ✅" : "No Internet Connection ❌",
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        backgroundColor: isConnected ? Colors.green : Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
