import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:viceversa/utils/constants/api_constants.dart';
import 'package:viceversa/data/models/user_model.dart';
import 'package:viceversa/utils/constants/enums.dart';

class AuthenticationService extends GetxService {
  static AuthenticationService get instance => Get.find();

  // Register method now returns a User object
  Future<User> register(
      String firstName, String lastName, String email, String password) async {
    final url = Uri.parse(ApiConstants.vRegister);
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        // Laravel typically returns a 201 status code for successful creation
        final responseData = jsonDecode(response.body);
        return User.fromJson(
            responseData); // Convert the response to a User object
      } else {
        throw Exception('Registration failed: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error during registration: $e');
    }
  }

  // Login method now returns a User object
  Future<User> login(String email, String password) async {
    final url = Uri.parse(ApiConstants.vLogin);
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return User.fromJson(responseData);
      } else {
        throw VError.invalidCredentials;
      }
    } catch (e) {
      if (e is VError) {
        rethrow;
      }
      throw Exception('Error during login: $e');
    }
  }
}
