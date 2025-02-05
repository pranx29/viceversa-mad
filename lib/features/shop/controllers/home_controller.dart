import 'package:get/get.dart';
import 'package:viceversa/utils/helpers/battery_indicator.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();
  final _batteryIndicator = BatteryIndicator.instance;

  final carouselCurrentIndex = 0.obs;
  final batteryLevel = 100.obs;

  void onCarouselPageChanged(int index) {
    carouselCurrentIndex.value = index;
  }

  Future<void> getBatteryLevel() async {
    final level = await _batteryIndicator.getBatteryLevel();
    batteryLevel.value = level;
  }

  String getBatteryMessage() {
    if (batteryLevel.value > 80) {
      return "Full power, full style!";
    } else if (batteryLevel.value > 50) {
      return "Power’s good, keep shining!";
    } else if (batteryLevel.value > 20) {
      return "Low battery, but still stylish!";
    } else {
      return "Time to charge up and shop!";
    }
  }

  @override
  void onInit() {
    getBatteryLevel();
    super.onInit();
  }
}
