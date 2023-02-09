import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/category.dart';
import '../models/product.dart';

class ProductFirebaseRepo {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List<Product>> findProducts() async {
    final query = db.collection("products").withConverter(
          fromFirestore: Product.fromFirestore,
          toFirestore: (Product product, _) => product.toFirestore(),
        );
    try {
      final docSnap = await query.get();
      List<Product> products = [];
      docSnap.docs.forEach((element) {
        products.add(
          Product(
            id: element.id,
            category: element.data().category,
            name: element.data().name,
            description: element.data().description,
            color: element.data().color,
            price: element.data().price,
            images: element.data().images as List<String>,
          ),
        );
      });
      //log(products.toString());
      return products;
    } on FirebaseException {
      rethrow;
    }
  }

  Future<List<Category>> findCategories() async {
    final query = db.collection("categories").withConverter(
          fromFirestore: Category.fromFirestore,
          toFirestore: (Category category, _) => category.toFirestore(),
        );
    try {
      final docSnap = await query.get();
      List<Category> categories = [];
      docSnap.docs.forEach((element) {
        categories.add(
          Category(
            id: element.id,
            title: element.data().title,
          ),
        );
      });
      return categories;
    } on FirebaseException {
      rethrow;
    }
  }

/*
  Future<void> getAll() async {
    // Future<List<Products>> getAll() async {
    final query = db.collection("products").withConverter(
      fromFirestore: Products.fromFirestore,
      toFirestore: (Products product, _) => product.toFirestore(),
    );
    final docSnap = await query.get();
    docSnap.docs.forEach((element) {
      print(element.data().name);
    });
    // return List<Products>.from(docSnap.docs);
  }*/

/*  Future<void> getOne() async {
    final query =
        db.collection("products").doc('Mn4naavwjeUWxVn7yLhz').withConverter(
              fromFirestore: Product.fromFirestore,
              toFirestore: (Product product, _) => product.toFirestore(),
            );
    final docSnap = await query.get();
    final product = docSnap.data(); // Convert to City object
    if (product != null) {
      print(product.toString());
    } else {
      print("No such document.");
    }
  }*/

/*  Future<List<String>> getCategories() async {
    final query = await db.collection("products").get();
    List<String> categories = [];
    categories.add('Todas');
    query.docs.forEach((element) {
      categories.add(element.get('category'));
    });
    return categories;
  }*/

/*  Future<List<String>> getProductsByCategory(String category) async {
    final query = await db
        .collection("products")
        .where("category", isEqualTo: category)
        .get();
    List<String> products = [];
    query.docs.forEach((element) {
      products.add(element.get('name'));
    });
    return products;
  }*/
}
