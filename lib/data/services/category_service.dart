import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:viceversa/data/models/category_model.dart';
import 'package:viceversa/utils/constants/api_constants.dart';

class CategoryService extends GetxController {
  static CategoryService get instance => Get.find();

  /// Fetch all categories
  Future<List<Category>> getAllCategories() async {
    final url = Uri.parse(ApiConstants.vCategories);
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        return responseData
            .map((categoryJson) => Category.fromJson(categoryJson))
            .toList();
      } else {
        throw Exception('Failed to fetch categories: ${response.body}');
      }
    } catch (e) {
      throw Exception('Service error during fetching categories: $e');
    }
  }

  /// Fetch category by ID
  Future<Category> getCategoryById(int id) async {
    final url = Uri.parse('${ApiConstants.vCategories}/$id');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return Category.fromJson(responseData);
      } else {
        throw Exception('Failed to fetch category: ${response.body}');
      }
    } catch (e) {
      throw Exception('Service error during fetching category: $e');
    }
  }
}
