import 'package:viceversa/data/models/address_model.dart';

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String token;
  final List<Address> addresses;

  User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.token,
      this.addresses = const []});

  // Factory constructor to create a User from a JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['id'],
      firstName: json['user']['first_name'],
      lastName: json['user']['last_name'],
      email: json['user']['email'],
      token: json['token'],
      addresses: json['user']['addresses'] != null
          ? List<Address>.from(json['user']['addresses']
              .map((address) => Address.fromJson(address)))
          : [],
    );
  }

  // Method to convert a User object to a JSON map
  toJson() {
    return {
      'user': {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
      },
      'token': token,
      'addresses': addresses.map((address) => address.toJson()).toList(),
    };
  }

  // Method to create empty User object
  static User empty() {
    return User(
      id: 0,
      firstName: '',
      lastName: '',
      email: '',
      token: '',
      addresses: [],
    );
  }
}
