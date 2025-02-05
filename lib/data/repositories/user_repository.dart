import 'package:get/get.dart';
import 'package:viceversa/data/models/address_model.dart';
import 'package:viceversa/data/models/user_model.dart';
import 'package:viceversa/data/services/user_service.dart';
import 'package:viceversa/utils/constants/enums.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _userService = UserService.instance;

  Future<User> fetchUserDetails() async {
    try {
      final user = await _userService.fetchUserDetails();
      return User(
          id: user.id,
          firstName: user.firstName,
          lastName: user.lastName,
          email: user.email,
          token: '',
          addresses: user.addresses);
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
        throw Exception('Repository error during fetching user details: $e');
      }
    }
  }

  Future<void> updateUserDetails(User user) async {
    try {
      await _userService.updateUserDetails(user);
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
        throw Exception('Repository error during updating user details: $e');
      }
    }
  }

  Future<void> updatePassword(String password) async {
    try {
      await _userService.updateUserPassword(password);
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
        throw Exception('Repository error during updating password: $e');
      }
    }
  }

  Future<void> addAddress(Address address) async {
    try {
      await _userService.addAddress(address);
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
        throw Exception('Repository error during adding address: $e');
      }
    }
  }
}
