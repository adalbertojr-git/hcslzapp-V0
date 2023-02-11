import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String? id;
  String? category;
  String? name;
  String? description;
  String? color;
  String? price;
  List<String>? images;
  Map<String, String>? stockBySize;

  Product({
    required this.id,
    required this.category,
    required this.name,
    required this.description,
    required this.color,
    required this.price,
    required this.images,
    required this.stockBySize,
  });

  factory Product.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Product(
      id: data?['id'],
      category: data?['category'],
      name: data?['name'],
      description: data?['description'],
      color: data?['color'],
      price: data?['price'],
      images: data?['images'] is Iterable ? List.from(data?['images']) : null,
      stockBySize: data?['stockBySize'] is Iterable
          ? Map<String, String>.from(data?['stockBySize'])
          : null,

    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (category != null) "category": category,
      if (name != null) "name": name,
      if (description != null) "description": description,
      if (color != null) "color": color,
      if (price != null) "price": price,
      if (images != null) "images": images,
      if (stockBySize != null) "stockBySize": stockBySize,
    };
  }

  @override
  String toString() {
    return 'Product{id: $id, category: $category, '
        'name: $name, description: $description,'
        'price: $price, color: $color, '
        'images: $images, stockBySize: $stockBySize}';
  }
}
