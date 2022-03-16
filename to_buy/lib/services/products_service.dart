import '../repositories/products_repository.dart';
import '../classes/product.dart';

import '../classes/signature.dart';

class ProductsService {
  static final ProductsRepository _productsRepository = ProductsRepositoryCloudFirestore();

  static final Products testProducts = {
    '1': Product(
      name: 'Product 1',
      description: 'Description 1',
      added: Signature(user: 'User 1', timestamp: DateTime.now().millisecondsSinceEpoch),
    ),
    '2': Product(
      name: 'Product 2',
      added: Signature(user: 'User 2', timestamp: DateTime.now().millisecondsSinceEpoch),
    ),
  };

  static final Products _products = testProducts; // Order by added date & split by bought

  static Products productsToBuy() {
    Products products = Map.of(_products);
    products.removeWhere((key, value) => value.bought != null && value.removed != null);
    return products;
  }

  static Products productsBought() {
    Products products = Map.of(_products);
    products.removeWhere((key, value) => value.bought == null && value.removed != null);
    return products;
  }

  // static Products productsRemoved() {
  //   Products products = Map.of(_products);
  //   products.removeWhere((key, value) => value.removed == null);
  //   return products;
  // }

  static Product getProduct(String productId) => _products[productId]!;
}
