import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:viceversa/utils/constants/api_constants.dart';

class ExchangeCurrencyService extends GetxService {
  static ExchangeCurrencyService get instance => Get.find();

  final String _apiKey = ApiConstants.currencyApiKey;

  // Fetch exchange rates for a base currency
  Future<Map<String, double>?> fetchExchangeRates(String baseCurrency) async {
    final url =
        '${ApiConstants.currencyBaseUrl}apikey=$_apiKey&base=$baseCurrency';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      if (data.containsKey('data')) {
        final Map<String, dynamic> exchangeRates = data['data'];
        return exchangeRates.map((key, value) =>
            MapEntry(key, value.toDouble())); // Convert all values to double
      }
    }
    return null; // Return null if no data or error occurs
  }

  
}
