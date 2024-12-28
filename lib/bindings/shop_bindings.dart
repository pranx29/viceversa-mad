import 'package:get/get.dart';
import 'package:viceversa/data/repositories/category_repository.dart';
import 'package:viceversa/data/repositories/product_repository.dart';
import 'package:viceversa/data/services/category_service.dart';
import 'package:viceversa/data/services/product_service.dart';

class ShopBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductService());
    Get.lazyPut(() => CategoryService());
  }
}
