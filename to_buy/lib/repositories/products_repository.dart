import 'package:cloud_firestore/cloud_firestore.dart';
import '../classes/product.dart';

abstract class ProductsRepository {
  Stream<Products> productsStream(String currentListId);
  Future<void> addProduct(String currentGroupId, String currentListId, Product product);
  Future<bool> updateProduct(String currentGroupId, String currentListId, Product product);
}

class ProductsRepositoryCloudFirestore implements ProductsRepository {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;

  @override
  Stream<Products> productsStream(String currentListId) => _instance
      .collection('lists')
      .doc(currentListId)
      .collection('products')
      .snapshots()
      .map((snapshot) => {for (var doc in snapshot.docs) doc.id: Product.fromMap(doc.data())});

  @override
  Future<void> addProduct(String currentGroupId, String currentListId, Product product) {
    // TODO: implement addProduct
    throw UnimplementedError();
  }

  @override
  Future<bool> updateProduct(String currentGroupId, String currentListId, Product product) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }
}
