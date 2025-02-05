import 'package:get/get.dart';
import 'package:viceversa/data/models/product_model.dart';
import 'package:viceversa/data/repositories/product_repository.dart';
import 'package:viceversa/utils/helpers/currency_mapper.dart';
import 'package:viceversa/utils/popups/loaders.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final _productRepository = Get.put(ProductRepository());
  RxList<Product> bestSellerProducts = <Product>[].obs;
  RxList<Product> discountedProducts = <Product>[].obs;
  RxList<Product> allProducts = <Product>[].obs;

  @override
  void onInit() {
    fetchBestSellerProducts();
    fetchDiscountedProducts();
    fetchAllProducts();
    super.onInit();
  }

  Future<void> fetchAllProducts() async {
    try {
      isLoading.value = true;
      final products = await _productRepository.fetchAllProducts();
      allProducts.assignAll(products);
    } catch (e) {
      VLoaders.errorSnackBar(title: "Error", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchBestSellerProducts() async {
    try {
      isLoading.value = true;
      final products = await _productRepository.fetchBestSellerProducts();
      bestSellerProducts.assignAll(products);
    } catch (e) {
      VLoaders.errorSnackBar(title: "Error", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchDiscountedProducts() async {
    try {
      isLoading.value = true;
      final products = await _productRepository.fetchDiscountedProducts();
      discountedProducts.assignAll(products);
    } catch (e) {
      VLoaders.errorSnackBar(title: "Error", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // fetch product by category i
  Future<void> fetchProductsByCategoryId(int categoryId) async {
    try {
      isLoading.value = true;
      final products =
          await _productRepository.fetchProductsByCategoryId(categoryId);
      allProducts.assignAll(products);
    } catch (e) {
      VLoaders.errorSnackBar(title: "Error", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // fetch products by search query
  Future<void> fetchProductsBySearchQuery(String query) async {
    try {
      isLoading.value = true;
      final products =
          await _productRepository.fetchProductsBySearchQuery(query);
      allProducts.assignAll(products);
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
      return CurrencyMapper.instance
          .convertPrice(finalPrice)
          .toStringAsFixed(2);
    } else {
      return CurrencyMapper.instance.convertPrice(price).toStringAsFixed(2);
    }
  }

  String getProductOriginalPrice(Product product) {
    return CurrencyMapper.instance
        .convertPrice(product.price)
        .toStringAsFixed(2);
  }

  String? calculateDiscountPercentage(double originalPrice, double? discount) {
    if (discount == null || discount == 0) {
      return null;
    }
    final discountPercentage = (discount / originalPrice) * 100;
    return '${discountPercentage.toStringAsFixed(0)}%';
  }
}
