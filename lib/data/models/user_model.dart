class User {
  final String token;
  final String firstName;
  final String lastName;
  final String email;

  User({
    required this.token,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  // Factory constructor to create a User from a JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      token: json['token'],
      firstName: json['user']['first_name'],
      lastName: json['user']['last_name'],
      email: json['user']['email'],
    );
  }

  // Method to convert a User object to a JSON map
  toJson() {
    return {
      'token': token,
      'user': {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
      },
    };
  }
}
