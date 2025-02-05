import 'package:battery_plus/battery_plus.dart';
import 'package:get/get.dart';

class BatteryIndicator {
  static BatteryIndicator get instance => Get.find();

  // Get the battery level
  Future<int> getBatteryLevel() async {
    final battery = Battery();
    try {
      final batteryLevel = await battery.batteryLevel;
      return batteryLevel;
    } catch (e) {
      return 100;
    }
  }
}
