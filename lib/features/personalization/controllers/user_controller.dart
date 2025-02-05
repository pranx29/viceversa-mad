import 'package:get/get.dart';
import 'package:viceversa/data/models/user_model.dart';
import 'package:viceversa/data/repositories/authentication_repository.dart';
import 'package:viceversa/data/repositories/user_repository.dart';
import 'package:viceversa/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userReporsitory = Get.put(UserRepository());

  Rx<User> user = User.empty().obs;

  @override
  void onInit() {
    super.onInit();
    if (AuthenticationRepository.instance.isLoggedIn()) {
      fetchUserData();
    }
  }

  Future<void> fetchUserData() async {
    try {
      final user = await userReporsitory.fetchUserDetails();
      this.user(user);
    } catch (e) {
      VLoaders.errorSnackBar(title: "Error", message: e.toString());
    }
  }

  // Logout the user
  Future<void> logout() async {
    try {
      await AuthenticationRepository.instance.logout();
    } catch (e) {
      VLoaders.errorSnackBar(title: "Error", message: e.toString());
    }
  }
}
