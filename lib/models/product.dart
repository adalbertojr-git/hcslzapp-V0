import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String? name;
  String? description;
  List<String>? images;

  Product({
    required this.name,
    required this.description,
    required this.images,
  });

  factory Product.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Product(
      name: data?['name'],
      description: data?['description'],
      images: data?['images'] is Iterable ? List.from(data?['images']) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (description != null) "description": description,
      if (images != null) "images": images,
    };
  }

  @override
  String toString() {
    return 'Product{name: $name, description: $description, images: $images}';
  }

}
