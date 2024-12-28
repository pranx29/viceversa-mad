class Category {
  final int id;
  final String name;
  final String image;

  Category({required this.image, required this.id, required this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      image: json['image'],
      id: json['id'],
      name: json['name'],
    );
  }

  toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }
}
