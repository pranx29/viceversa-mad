import 'package:get/get.dart';
import 'package:viceversa/data/models/category_model.dart';
import 'package:viceversa/data/services/category_service.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();
  final _categoryService = CategoryService.instance;

  /// Fetch all categories
  Future<List<Category>> fetchAllCategories() async {
    try {
      final categories = await _categoryService.getAllCategories();
      return categories;
    } catch (e) {
      throw Exception('Repository error during fetching categories: $e');
    }
  }

  /// Fetch category by ID
  Future<Category> fetchCategoryById(int id) async {
    try {
      final category = await _categoryService.getCategoryById(id);
      return category;
    } catch (e) {
      throw Exception('Repository error during fetching category: $e');
    }
  }
}
