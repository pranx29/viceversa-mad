import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:viceversa/utils/constants/currencies.dart';
import 'package:viceversa/utils/helpers/geolocator.dart';

class CurrencyMapper {
  static CurrencyMapper get instance => Get.find();
  final GetStorage _storage = GetStorage();
  final String _currencyKey = 'currency';

  String currency = '';

  CurrencyMapper() {
    _init();
  }

  Future<void> _init() async {
    await getCurrency();
  }

  Future<void> getCurrency() async {
    // Check if currency is already stored
    final country = await GeoLocator.instance.getCountry();
    String currencyCode = vCurrencies[country] ?? 'LKR';

    // Store the currency for future use
    _storage.write(_currencyKey, currencyCode);
    currency = currencyCode;
  }

  double convertPrice(double price) {
    double exchangeRate = vExchangeRates[currency] ?? 1.0;
    return price * exchangeRate;
  }

  Future<void> clearCurrency() async {
    await _storage.remove(_currencyKey);
  }
}
