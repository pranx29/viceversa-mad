class ProductImage {
  final int id;
  final String path;
  final int order;

  ProductImage({
    required this.id,
    required this.path,
    required this.order,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      id: json['id'],
      path: json['path'],
      order: json['order'],
    );
  }

  toJson() {
    return {
      'id': id,
      'path': path,
      'order': order,
    };
  }
}
