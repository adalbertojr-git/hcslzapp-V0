import 'package:cloud_firestore/cloud_firestore.dart';

class Products {
  String? name;
  String? description;
  List<String>? images;

  Products({
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
    return 'Products{name: $name, description: $description, images: $images}';
  }

}
