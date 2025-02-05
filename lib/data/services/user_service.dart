import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:viceversa/data/models/address_model.dart';
import 'package:viceversa/data/repositories/authentication_repository.dart';
import 'package:viceversa/utils/constants/api_constants.dart';
import 'package:viceversa/data/models/user_model.dart';
import 'package:viceversa/utils/constants/enums.dart';

class UserService extends GetxService {
  static UserService get instance => Get.find();

  Future<User> fetchUserDetails() async {
    final url = Uri.parse(ApiConstants.vUser);
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer ${AuthenticationRepository.instance.authUser?.token}'
        },
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return User(
            id: responseData['user']['id'],
            firstName: responseData['user']['first_name'],
            lastName: responseData['user']['last_name'],
            email: responseData['user']['email'],
            token: '',
            addresses: List<Address>.from(responseData['user']['addresses']
                .map((address) => Address.fromJson(address))));
      } else {
        throw Exception('Failed to load user data: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error fetching user data: $e');
    }
  }

  Future<void> updateUserDetails(User user) async {
    final url = Uri.parse(ApiConstants.vUser);
    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer ${AuthenticationRepository.instance.authUser?.token}'
        },
        body: jsonEncode(user.toJson()),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to update user data: ${response.body}');
      }
    } catch (e) {
      if (e is VError) {
        rethrow;
      }
      throw Exception('Error updating user data: $e');
    }
  }

  Future<void> updateUserPassword(String password) async {
    final url = Uri.parse(ApiConstants.vUserPassword);
    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer ${AuthenticationRepository.instance.authUser?.token}'
        },
        body: jsonEncode({'password': password}),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to update user password: ${response.body}');
      }
    } catch (e) {
      if (e is VError) {
        rethrow;
      }
      throw Exception('Error updating user password: $e');
    }
  }

  Future<void> addAddress(Address address) async {
    final url = Uri.parse(ApiConstants.vUserAddress);
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer ${AuthenticationRepository.instance.authUser?.token}'
        },
        body: jsonEncode(address.toJson()),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to add address: ${response.body}');
      }
    } catch (e) {
      if (e is VError) {
        rethrow;
      }
      throw Exception('Error adding address: $e');
    }
  }
}
