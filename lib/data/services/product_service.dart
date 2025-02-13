import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:viceversa/data/models/product_model.dart';
import 'package:viceversa/utils/constants/api_constants.dart';

class ProductService extends GetxService {
  static ProductService get instance => Get.find();

  /// Get all products
  Future<List<Product>> getAllProducts() async {
    final url = Uri.parse(ApiConstants.vProducts);
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        return responseData
            .map((productJson) => Product.fromJson(productJson))
            .toList();
      } else {
        throw Exception('Failed to fetch products: ${response.body}');
      }
    } catch (e) {
      throw Exception('Service error during fetching products: $e');
    }
  }

  // Get best seller products
  Future<List<Product>> getBestSellerProducts() async {
    final url = Uri.parse(ApiConstants.vBestSellerProducts);
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        return responseData
            .map((productJson) => Product.fromJson(productJson))
            .toList();
      } else {
        throw Exception(
            'Failed to fetch best seller products: ${response.body}');
      }
    } catch (e) {
      throw Exception('Service error during fetching best seller products: $e');
    }
  }

  // Get discounted products
  Future<List<Product>> getDiscountedProducts() async {
    final url = Uri.parse(ApiConstants.vDiscountedProducts);
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        return responseData
            .map((productJson) => Product.fromJson(productJson))
            .toList();
      } else {
        throw Exception(
            'Failed to fetch discounted products: ${response.body}');
      }
    } catch (e) {
      throw Exception('Service error during fetching discounted products: $e');
    }
  }

  // Get products by category ID
  Future<List<Product>> getProductsByCategoryId(int categoryId) async {
    final url = Uri.parse('${ApiConstants.vProductByCategory}/$categoryId');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        return responseData
            .map((productJson) => Product.fromJson(productJson))
            .toList();
      } else {
        throw Exception(
            'Failed to fetch products by category: ${response.body}');
      }
    } catch (e) {
      throw Exception('Service error during fetching products by category: $e');
    }
  }

  /// Get a single product by ID
  Future<Product> getProductById(int id) async {
    final url = Uri.parse('${ApiConstants.vProducts}/$id');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return Product.fromJson(responseData);
      } else {
        throw Exception('Failed to fetch product: ${response.body}');
      }
    } catch (e) {
      throw Exception('Service error during fetching product: $e');
    }
  }

  // Get products by search query
  Future<List<Product>> getProductsBySearchQuery(String query) async {
    final url = Uri.parse('${ApiConstants.vProductBySearchQuery}$query');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        return responseData
            .map((productJson) => Product.fromJson(productJson))
            .toList();
      } else {
        throw Exception(
            'Failed to fetch products by search query: ${response.body}');
      }
    } catch (e) {
      throw Exception(
          'Service error during fetching products by search query: $e');
    }
  }
}
