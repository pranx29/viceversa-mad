import 'package:viceversa/data/models/category_model.dart';
import 'package:viceversa/data/models/product_image_model.dart';
import 'package:viceversa/data/models/size_model.dart';

class Product {
  final int id;
  final String slug;
  final String name;
  final String description;
  final double price;
  final double? discount;
  final bool isActive;
  final Category category;
  final List<ProductImage> images;
  final List<Size> sizes;

  Product({
    required this.id,
    required this.slug,
    required this.name,
    required this.description,
    required this.price,
    this.discount,
    required this.isActive,
    required this.category,
    required this.images,
    required this.sizes,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      slug: json['slug'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      discount: json['discount'] != null
          ? (json['discount'] as num).toDouble()
          : null,
      isActive: json['is_active'] == 1,
      category: Category.fromJson(json['category']),
      images: (json['images'] as List)
          .map((imageJson) => ProductImage.fromJson(imageJson))
          .toList(),
      sizes: (json['sizes'] as List)
          .map((sizeJson) => Size.fromJson(sizeJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'slug': slug,
      'name': name,
      'description': description,
      'price': price,
      'discount': discount,
      'is_active': isActive ? 1 : 0,
      'category': category.toJson(),
      'images': images.map((image) => image.toJson()).toList(),
      'sizes': sizes.map((size) => size.toJson()).toList(),
    };
  }
}
