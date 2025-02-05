import 'package:get/get.dart';
import 'package:viceversa/utils/helpers/battery_indicator.dart';
import 'package:viceversa/utils/helpers/currency_mapper.dart';
import 'package:viceversa/utils/helpers/geolocator.dart';
import 'package:viceversa/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(GeoLocator());
    Get.put(CurrencyMapper());
    Get.put(BatteryIndicator());
  }
}
