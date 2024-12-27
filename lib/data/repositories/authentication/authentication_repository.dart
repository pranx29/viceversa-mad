import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:viceversa/common/widgets/navigation_menu.dart';
import 'package:viceversa/data/models/user_model.dart';
import 'package:viceversa/data/services/authentication_service.dart';
import 'package:viceversa/features/authentication/screens/welcome_screen.dart';
import 'package:viceversa/utils/constants/enums.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final _authService = AuthenticationService.instance;
  final localStorage = GetStorage();

  // Check if user is logged in by verifying token
  bool isLoggedIn() {
    final token = localStorage.read('token');
    return token != null && token.isNotEmpty;
  }

  /// Function to Register User
  Future<User> register(
      String firstName, String lastName, String email, String password) async {
    try {
      final user =
          await _authService.register(firstName, lastName, email, password);

      if (user.token.isNotEmpty) {
        localStorage.write('token', user.token); // Save token in local storage
        return user;
      } else {
        throw Exception('Registration failed: ${user.token}');
      }
    } catch (e) {
      throw Exception('Repository error during registration: $e');
    }
  }

  /// Function to Login User
  Future<User> login(String email, String password) async {
    try {
      final user = await _authService.login(email, password);

      if (user.token.isNotEmpty) {
        localStorage.write('token', user.token); // Save token in local storage
        return user;
      } else {
        throw VError.unknownError;
      }
    } catch (e) {
      if (e == VError.invalidCredentials) {
        throw VError.invalidCredentials;
      } else if (e == VError.networkError) {
        throw VError.networkError;
      } else if (e == VError.serverError) {
        throw VError.serverError;
      } else if (e == VError.unknownError) {
        throw VError.unknownError;
      } else {
        throw Exception('Repository error during login: $e');
      }
    }
  }

  // Logout function to clear stored token
  void logout() {
    localStorage.remove('token');
    Get.offAll(() => WelcomeScreen());
  }

  // Function to check and navigate based on token presence
  void checkAuthenticationStatus() {
    if (isLoggedIn()) {
      // Navigate to the home screen if the user is logged in
      Get.offAll(() => const NavigationMenu());
    } else {
      // Navigate to the welcome/login screen if not logged in
      Get.offAll(() => WelcomeScreen());
    }
  }
}
