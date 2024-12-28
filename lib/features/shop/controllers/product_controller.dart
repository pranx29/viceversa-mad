import 'package:get/get.dart';
import 'package:viceversa/data/models/product_model.dart';
import 'package:viceversa/data/repositories/product_repository.dart';
import 'package:viceversa/utils/popups/loaders.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final _productRepository = Get.put(ProductRepository());
  RxList<Product> bestSellerProducts = <Product>[].obs;

  @override
  void onInit() {
    fetchBestSellerProducts();
    super.onInit();
  }

  Future<void> fetchBestSellerProducts() async {
    try {
      isLoading.value = true;

      // Fetch products
      final products = await _productRepository.fetchBestSellerProducts();
      bestSellerProducts.assignAll(products);
    } catch (e) {
      VLoaders.errorSnackBar(title: "Error", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  String getProductPrice(Product product) {
    final discount = product.discount ?? 0;
    final price = product.price;
    final finalPrice = price - discount;

    if (discount > 0) {
      return finalPrice.toString();
    } else {
      return price.toString();
    }
  }

  String? calculateDiscountPercentage(double originalPrice, double? discount) {
    if (discount == null || discount == 0) {
      return null;
    }
    final discountPercentage = (discount / originalPrice) * 100;
    return '${discountPercentage.toStringAsFixed(2)}%';
  }
}
