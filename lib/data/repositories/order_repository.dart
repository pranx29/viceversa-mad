import 'package:get/get.dart';
import 'package:viceversa/data/models/order_model.dart';
import 'package:viceversa/data/services/order_service.dart';

class OrderRepository extends GetxController {

  static OrderRepository get instance => Get.find();
  final _orderService = OrderService.instance;

  // Fetch all orders
  Future<List<Order>> fetchAllOrders() async {
    try {
      final orders = await _orderService.fetchAllOrders();
      return orders;
    } catch (e) {
      throw Exception('Repository error during fetching orders: $e');
    }
  }
}
