import 'package:get/get.dart';
import 'package:viceversa/data/models/order_model.dart';
import 'package:viceversa/data/repositories/order_repository.dart';
import 'package:viceversa/features/personalization/controllers/user_controller.dart';
import 'package:viceversa/utils/popups/loaders.dart';

class OrderController extends GetxController {
  final _orderRepository = Get.put(OrderRepository());
  static OrderController get instance => Get.find();
  final userController = UserController.instance;
  final isLoading = false.obs;

  RxList<Order> orders = <Order>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllOrders();
  }

  Future<void> fetchAllOrders() async {
    try {
      isLoading.value = true;
      final fetchedOrders = await _orderRepository.fetchAllOrders();
      orders.assignAll(fetchedOrders);
      isLoading.value = false;
    } catch (e) {
      VLoaders.errorSnackBar(
          title: 'Error', message: 'Failed to fetch orders. Please try again.');
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }
}
