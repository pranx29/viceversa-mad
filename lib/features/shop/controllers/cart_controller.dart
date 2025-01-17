import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:viceversa/data/models/cart_item_model.dart';
import 'package:viceversa/data/models/product_model.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/local_storage/storage_utility.dart';
import 'package:viceversa/utils/popups/loaders.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();
  final localStorage = GetStorage();

  final RxInt cartCount = 0.obs;
  final RxDouble totalAmount = 0.0.obs;
  RxString selectedSize = ''.obs;

  RxList<CartItem> cartItems = <CartItem>[].obs;

  void addToCart(Product product, int quantity) {
    // TODO: Check stock availability

    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == product.id &&
        cartItem.size == selectedSize.value);

    if (index != -1) {
      cartItems[index].quantity += quantity;
      cartItems[index].price = product.price;
    } else {
      cartItems.add(convertProductToCartItem(product, quantity));
    }

    updateCart();
    VLoaders.toastMessage(message: 'Product added to cart');
  }

  CartItem convertProductToCartItem(Product product, int quantity) {
    return CartItem(
      productId: product.id,
      name: product.name,
      image: product.images.first.path,
      price: product.price,
      size: selectedSize.value,
      quantity: quantity,
    );
  }

  void updateCart() {
    cartCount.value = cartItems.length;
    totalAmount.value = cartItems.fold(
        0,
        (previousValue, cartItem) =>
            previousValue + cartItem.price * cartItem.quantity);
    saveCart();
    cartItems.refresh();
  }

  void saveCart() {
    final cartItemStrings =
        cartItems.map((cartItem) => cartItem.toJson()).toList();
    localStorage.write('cartItems', cartItemStrings);
  }

  void loadCart() {
    final cartItemStrings = localStorage.read('cartItems');
    if (cartItemStrings != null) {
      cartItems.value = cartItemStrings
          .map((cartItemString) => CartItem.fromJson(cartItemString))
          .toList()
          .obs;
      updateCart();
    }
  }

  void clearCart() {
    cartItems.clear();
    cartCount.value = 0;
    totalAmount.value = 0;
    updateCart();
  }

  void incrementCartItemQuantity(CartItem cartItem) {
    int index = cartItems.indexWhere((item) =>
        item.productId == cartItem.productId && item.size == cartItem.size);
    if (index != -1) {
      cartItems[index].quantity++;
      updateCart();
    }
  }

  void decrementCartItemQuantity(CartItem cartItem) {
    int index = cartItems.indexWhere((item) =>
        item.productId == cartItem.productId && item.size == cartItem.size);
    if (index != -1 && cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
      updateCart();
    }
  }

  void removeCartItem(CartItem cartItem, bool isDarkTheme) {
    Get.defaultDialog(
      backgroundColor: isDarkTheme ? VColor.primaryForeground : VColor.primary,
      titleStyle: TextStyle(
          color: isDarkTheme ? VColor.primary : VColor.primaryForeground),
      middleTextStyle: TextStyle(
          color: isDarkTheme ? VColor.secondary : VColor.secondaryForeground),
      confirm: ElevatedButton(
        style: ButtonStyle(
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          ),
          backgroundColor: WidgetStateProperty.all<Color>(
            isDarkTheme ? VColor.primary : VColor.primaryForeground,
          ),
        ),
        child: Text('Remove',
            style: TextStyle(
                color:
                    isDarkTheme ? VColor.primaryForeground : VColor.primary)),
        onPressed: () {
          Get.back();
          cartItems.removeWhere((item) =>
              item.productId == cartItem.productId &&
              item.size == cartItem.size);
          updateCart();
        },
      ),
      cancel: OutlinedButton(
          style: ButtonStyle(
            padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
            side: WidgetStateProperty.all<BorderSide>(
              BorderSide(
                color: isDarkTheme ? VColor.primary : VColor.primaryForeground,
                width: 2,
              ),
            ),
          ),
          onPressed: () {
            Get.back();
          },
          child: Text('Cancel',
              style: TextStyle(
                  color: isDarkTheme
                      ? VColor.primary
                      : VColor.primaryForeground))),
      title: 'Remove from Cart',
      middleText: 'Are you sure you want to remove this item from cart?',
    );
  }
}
