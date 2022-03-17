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
    '3': Product(
      name: 'Product 3',
      description: 'Description 3',
      added: Signature(user: 'User 3', timestamp: DateTime.now().millisecondsSinceEpoch),
    ),
    '4': Product(
      name: 'Product 4',
      description: 'Description 4',
      added: Signature(user: 'User 4', timestamp: DateTime.now().millisecondsSinceEpoch),
    ),
    '5': Product(
      name: 'Product 5',
      description: 'Description 5',
      added: Signature(user: 'User 5', timestamp: DateTime.now().millisecondsSinceEpoch),
    ),
    '6': Product(
      name: 'Product 6',
      added: Signature(user: 'User 6', timestamp: DateTime.now().millisecondsSinceEpoch),
    ),
    '7': Product(
      name: 'Product 7',
      added: Signature(user: 'User 7', timestamp: DateTime.now().millisecondsSinceEpoch),
    ),
    '8': Product(
      name: 'Product 8',
      description: 'Description 8',
      added: Signature(user: 'User 8', timestamp: DateTime.now().millisecondsSinceEpoch),
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
