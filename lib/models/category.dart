import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  String? id;
  String? title;

  Category({
    required this.id,
    required this.title,
  });

  factory Category.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Category(
      id: data?['id'],
      title: data?['title'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (title != null) "title": title,
    };
  }

  @override
  String toString() {
    return 'Category{id: $id, title: $title}';
  }
}
