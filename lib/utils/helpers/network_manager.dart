import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:viceversa/utils/popups/loaders.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  /// Initialize the network manager and set up a stream to continually check the connection status.
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((results) {
      _updateConnectionStatus(results.first);
    });
  }

  /// Update the connection status based on changes in connectivity and show a relevant popup for no internet connection.
  void _updateConnectionStatus(ConnectivityResult result) {
    _connectionStatus.value = result;
    if (_connectionStatus.value == ConnectivityResult.none) {
      VLoaders.warningSnackBar(title: 'No Internet Connection');
    }
  }

  /// Check the internet connection status.
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result.contains(ConnectivityResult.none)) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
