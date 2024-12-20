class VPricingCalculator {
  ///-- Calculate Price based on tax and shipping
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    double shippingCost = getShippingCost(location);
    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  /// -- Calculate shipping cost
  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  ///-- Calculate tax
  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  /// Helper method to get tax rate
  static double getTaxRateForLocation(String location) {
    // Implementation needed
    return 0.1; // Default 10% tax rate
  }

  /// Helper method to get shipping cost
  static double getShippingCost(String location) {
    return 5.00; // Example shipping cost of $5
  }

  ///-- Sum all cart values and return total amount
  // static double calculateCartTotal(List<CartItem> items) {
  //   return items.map((e) => e.price).fold(0, (previousPrice, currentPrice) => previousPrice + (currentPrice ?? 0));
  // }
}
