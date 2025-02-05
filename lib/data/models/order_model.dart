import 'package:viceversa/data/models/address_model.dart';
import 'package:viceversa/data/models/product_model.dart';

import 'size_model.dart';

class Order {
  final int id;
  final Address address;
  final String shippingCost;
  final String status;
  final int total;
  final DateTime date;
  // final List<OrderItem> items;

  Order(
      {required this.id,
      required this.address,
      required this.shippingCost,
      required this.status,
      required this.total,
      required this.date
      // required this.items,
      });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      address: Address.fromJson(json['address']),
      shippingCost: json['shipping_cost'],
      status: json['status'],
      total: json['total'],
      date: DateTime.parse(json['created_at']),
      // items: (json['items'] as List)
      //     .map((item) => OrderItem.fromJson(item))
      //     .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'address': address.toJson(),
      'shipping_cost': shippingCost,
      'status': status,
      'total': total,
      'created_at': date,
      // 'items': items.map((item) => item.toJson()).toList(),
    };
  }
}

class OrderItem {
  final int id;
  final Product product;
  final int quantity;
  final double price;
  final Size size;

  OrderItem({
    required this.id,
    required this.product,
    required this.quantity,
    required this.price,
    required this.size,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'],
      product: Product.fromJson(json['product']),
      quantity: json['quantity'],
      price: json['price'],
      size: Size.fromJson(json['size']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product.toJson(),
      'quantity': quantity,
      'price': price,
      'size': size.toJson(),
    };
  }
}
