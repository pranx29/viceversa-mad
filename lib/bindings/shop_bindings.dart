import 'package:get/get.dart';
import 'package:viceversa/data/services/category_service.dart';
import 'package:viceversa/data/services/order_service.dart';
import 'package:viceversa/data/services/product_service.dart';
import 'package:viceversa/data/services/user_service.dart';
import 'package:viceversa/features/shop/controllers/cart_controller.dart';

class ShopBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductService());
    Get.lazyPut(() => CategoryService());
    Get.lazyPut(() => UserService());
    Get.lazyPut(()=> OrderService());
    Get.put(() => CartController());
  }
}
