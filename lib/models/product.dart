import 'package:cloud_firestore/cloud_firestore.dart';


class Product {
  String? id;
  String? category;
  String? name;
  String? description;
  String? color;
  List<String>? images;

  Product({
    required this.id,
    required this.category,
    required this.name,
    required this.description,
    required this.color,
    required this.images,
  });

  factory Product.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Product(
      id:  data?['id'],
      category:  data?['category'],
      name: data?['name'],
      description: data?['description'],
      color: data?['color'],
      images: data?['images'] is Iterable ? List.from(data?['images']) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (category != null) "category": category,
      if (name != null) "name": name,
      if (description != null) "description": description,
      if (color != null) "color": color,
      if (images != null) "images": images,
    };
  }

  @override
  String toString() {
    return 'Product{id: $id, category: $category, '
        'name: $name, description: $description,'
        'color: $color,}';
    // return 'Products{name: $name, description: $description, images: $images}';
  }

}
