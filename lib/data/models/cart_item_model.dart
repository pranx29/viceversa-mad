class CartItem {
  final int productId;
  final String name;
  final String image;
  final String size;
  int quantity;
  double price;

  CartItem({
    required this.productId,
    required this.name,
    required this.image,
    required this.size,
    required this.quantity,
    required this.price,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      productId: json['productId'],
      name: json['name'],
      image: json['image'],
      size: json['size'],
      quantity: json['quantity'],
      price: json['price'],
    );
  }

  toJson() {
    return {
      'productId': productId,
      'name': name,
      'image': image,
      'size': size,
      'quantity': quantity,
      'price': price,
    };
  }
}
