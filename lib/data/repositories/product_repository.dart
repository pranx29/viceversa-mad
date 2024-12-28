import 'package:get/get.dart';
import 'package:viceversa/data/models/product_model.dart';
import 'package:viceversa/data/services/product_service.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();
  final _productService = ProductService.instance;

  /// Fetch all products

  Future<List<Product>> fetchBestSellerProducts() async {
    try {
      final products = await _productService.getAllProducts();
      return products;
    } catch (e) {
      throw Exception('Repository error during fetching products: $e');
    }
  }

  /// Fetch product by ID
  Future<Product> fetchProductById(int id) async {
    try {
      final product = await _productService.getProductById(id);
      return product;
    } catch (e) {
      throw Exception('Repository error during fetching product: $e');
    }
  }
}
