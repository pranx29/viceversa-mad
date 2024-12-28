class Size {
  final int id;
  final String name;
  final int quantityInStock;

  Size({
    required this.id,
    required this.name,
    required this.quantityInStock,
  });

  factory Size.fromJson(Map<String, dynamic> json) {
    return Size(
      id: json['id'],
      name: json['name'],
      quantityInStock: json['pivot']['quantity_in_stock'],
    );
  }
}
