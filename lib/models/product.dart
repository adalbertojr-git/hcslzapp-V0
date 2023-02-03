import 'package:cloud_firestore/cloud_firestore.dart';


class Products {
  String? id;
  String? category;
  String? name;
  String? description;
  List<String>? images;

  Products({
    required this.id,
    required this.category,
    required this.name,
    required this.description,
    required this.images,
  });

  factory Products.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Products(
      id:  data?['id'],
      category:  data?['category'],
      name: data?['name'],
      description: data?['description'],
      images: data?['images'] is Iterable ? List.from(data?['images']) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (category != null) "category": category,
      if (name != null) "name": name,
      if (description != null) "description": description,
      if (images != null) "images": images,
    };
  }

  @override
  String toString() {
    return 'Products{id: $id,, category: $category, name: $name, description: $description}';
    // return 'Products{name: $name, description: $description, images: $images}';
  }

}
