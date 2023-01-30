import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductManager {
  final FirebaseFirestore storage = FirebaseFirestore.instance;

  Future<void> loadAll() async {
/*    await storage.collection("products").get().then((product) {
      for (var doc in product.docs) {
        debugPrint("${doc.id} => ${doc.data()['name']}");
      }
    });*/

    final ref = storage
        .collection("products")
        .doc("O4tt58L7MOheWeo4LFCj")
        .withConverter(
          fromFirestore: Product.fromFirestore,
          toFirestore: (Product product, _) => product.toFirestore(),
        );
    final docSnap = await ref.get();
    final product = docSnap.data(); // Convert to City object
    if (product != null) {
      print(product.toString());
    } else {
      print("No such document.");
    }
  }
}
