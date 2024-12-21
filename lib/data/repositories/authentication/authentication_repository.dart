import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:viceversa/data/models/user_model.dart';
import 'package:viceversa/data/services/authentication_service.dart';
import 'package:viceversa/features/authentication/screens/login_screen.dart';
import 'package:viceversa/features/authentication/screens/register_screen.dart';
import 'package:viceversa/features/authentication/screens/welcome_screen.dart';
import 'package:viceversa/utils/constants/enums.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final _authService = AuthenticationService.instance;

  final localStorage = GetStorage();

  AuthenticationRepository();

  @override
  void onReady() {
    super.onReady();
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  void screenRedirect() async {
    // Check if user is first time user
    localStorage.writeIfNull('IsFirstTime', true);

    if (localStorage.read('IsFirstTime') == true) {
      Get.offAll(WelcomeScreen());
    } else {
      final token = localStorage.read('token');
      if (token != null) {
        // If token exists, navigate to the main screen
        Get.offAll(const LoginScreen());
      } else {
        // Otherwise, navigate to the Login screen
        Get.offAll(const RegisterScreen());
      }
    }
  }

  /// Function to Register User
  Future<User> register(
      String firstName, String lastName, String email, String password) async {
    try {
      final user =
          await _authService.register(firstName, lastName, email, password);

      if (user.token.isNotEmpty) {
        localStorage.write('token', user.token);
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
        localStorage.write('token', user.token);
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
    screenRedirect();
  }
}
