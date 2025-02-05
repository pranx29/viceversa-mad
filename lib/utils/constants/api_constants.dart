class ApiConstants {
  // App API
  // Base url
  static const String baseUrl = 'http://localhost:8000/api/';

  // User urls
  static const String vUser = '${baseUrl}user';
  static const String vUserPassword = '${baseUrl}user/password';
  static const String vUserAddress = '${baseUrl}user/address';

  // Authentication urls
  static const String vLogin = '${baseUrl}login';
  static const String vRegister = '${baseUrl}register';
  static const String vLogout = '${baseUrl}logout';

  // Product urls
  static const String vProducts = '${baseUrl}products';
  static const String vBestSellerProducts = '${baseUrl}products/best-seller';
  static const String vDiscountedProducts = '${baseUrl}products/discounted';
  static const String vProductByCategory = '${baseUrl}products/category';
  static const String vProductBySearchQuery =
      '${baseUrl}products/search?query=';

  // Category urls
  static const String vCategories = '${baseUrl}categories';

  // Order urls
  static const String vOrders = '${baseUrl}orders';

  // Currency API
  static const String currencyApiKey =
      'fca_live_zzEIzYcokrM8zNmy4gfm6Ar8zRGL6Wjg94qa4FAO';
  static const String currencyBaseUrl =
      'https://api.freecurrencyapi.com/v1/latest?';
}
