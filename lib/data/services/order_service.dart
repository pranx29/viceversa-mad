import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:viceversa/data/models/order_model.dart';
import 'package:viceversa/data/repositories/authentication_repository.dart';
import 'package:viceversa/utils/constants/api_constants.dart';

class OrderService extends GetxService {
  static OrderService get instance => Get.find();

  Future<List<Order>> fetchAllOrders() async {
    final url = Uri.parse(ApiConstants.vOrders);
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer ${AuthenticationRepository.instance.authUser?.token}'
        },
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return List<Order>.from(responseData['orders'].map((order) => Order.fromJson(order)));
      } else {
        throw Exception('Failed to load orders: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error fetching orders: $e');
    }
  }
}
