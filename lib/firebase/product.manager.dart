import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';

class ProductManager {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> loadAll() async {
    final query = db.collection("products").doc('sdksdjksj').withConverter(
          fromFirestore: Products.fromFirestore,
          toFirestore: (Products product, _) => product.toFirestore(),
        );
    final docSnap = await query.get();
    final product = docSnap.data(); // Convert to City object
    if (product != null) {
      print(product.toString());
    } else {
      print("No such document.");
    }
  }

  Future<void> loadAll2() async {
    final query = await db
        .collection("products")
        .where("category", isEqualTo: "bonés")
        .get();
    query.docs.forEach((element) {
      print(element.get('name'));
    });
  }
}
