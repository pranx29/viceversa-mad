import 'package:get/get.dart';
import 'package:viceversa/data/models/category_model.dart';
import 'package:viceversa/data/repositories/category_repository.dart';
import 'package:viceversa/utils/popups/loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final _categoryRepository = Get.put(CategoryRepository());
  final RxList<Category> allCategories = <Category>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;
      final categories = await _categoryRepository.fetchAllCategories();
      allCategories.assignAll(categories);

      isLoading.value = false;
    } catch (e) {
      VLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
