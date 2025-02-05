class Address {
  final String? firstName;
  final String? lastName;
  final String street;
  final String city;
  final String postalCode;
  final String phoneNumber;

  Address({
    this.firstName,
    this.lastName,
    required this.street,
    required this.city,
    required this.postalCode,
    required this.phoneNumber,
  });

  // Factory constructor to create an Address from a JSON map
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      firstName: json['first_name'],
      lastName: json['last_name'],
      street: json['street'],
      city: json['city'],
      postalCode: json['postal_code'],
      phoneNumber: json['phone_number'],
    );
  }

  // Method to convert an Address object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'street': street,
      'city': city,
      'postal_code': postalCode,
      'phone_number': phoneNumber,
    };
  }

  // Method to create an empty Address object
  static Address empty() {
    return Address(
      firstName: null,
      lastName: null,
      street: '',
      city: '',
      postalCode: '',
      phoneNumber: '',
    );
  }
}
