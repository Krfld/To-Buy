import '../utils/logger.dart';

import '../repositories/products_repository.dart';
import '../classes/product.dart';

import '../classes/signature.dart'; //* Temp

class ProductsService {
  static final ProductsRepository _productsRepository = ProductsRepositoryCloudFirestore();

  // static final Products _testProducts = {
  //   '2': Product(
  //     name: 'Product 2',
  //     added: Signature(user: 'User 2', timestamp: DateTime.now().millisecondsSinceEpoch * 2),
  //   ),
  //   '3': Product(
  //     name: 'Product 3',
  //     description: 'Description 3',
  //     added: Signature(user: 'User 3', timestamp: DateTime.now().millisecondsSinceEpoch * 3),
  //   ),
  //   '1': Product(
  //     name: 'Product 1',
  //     description: 'Description 1',
  //     added: Signature(user: 'User 1', timestamp: DateTime.now().millisecondsSinceEpoch * 1),
  //   ),
  //   '4': Product(
  //     name: 'Product 4',
  //     description: 'Description 4',
  //     added: Signature(user: 'User 4', timestamp: DateTime.now().millisecondsSinceEpoch * 4),
  //     bought: Signature(user: 'User 4', timestamp: DateTime.now().millisecondsSinceEpoch * 4),
  //   ),
  //   '5': Product(
  //     name: 'Product 5',
  //     description: 'Description 5\n\nDescription 5\n\nDescription 5',
  //     added: Signature(user: 'User 5', timestamp: DateTime.now().millisecondsSinceEpoch * 5),
  //     bought: Signature(user: 'User 5', timestamp: DateTime.now().millisecondsSinceEpoch * 5),
  //   ),
  //   '8': Product(
  //     name: 'Product 8',
  //     description: 'Description 8\n\nDescription 8\n\nDescription 8',
  //     added: Signature(user: 'User 8', timestamp: DateTime.now().millisecondsSinceEpoch * 8),
  //   ),
  //   '6': Product(
  //     name: 'Product 6',
  //     added: Signature(user: 'User 6', timestamp: DateTime.now().millisecondsSinceEpoch * 6),
  //     bought: Signature(user: 'User 6', timestamp: DateTime.now().millisecondsSinceEpoch * 6),
  //   ),
  //   '7': Product(
  //     name: 'Product 7',
  //     description: 'Description 7\nDescription 7',
  //     added: Signature(user: 'User 7', timestamp: DateTime.now().millisecondsSinceEpoch * 7),
  //     // removed: Signature(user: 'User 7', timestamp: DateTime.now().millisecondsSinceEpoch * 7),
  //   ),
  // }; //* Temp

  // static late Products products;

  // static Products productsToBuy() => products.where((product) => product.content.bought == null).toList()
  //   ..sort((a, b) => a.content.added.compareTo(b.content.added));

  // static Products productsBought() => products.where((product) => product.content.bought != null).toList()
  //   ..sort((a, b) => b.content.bought!.compareTo(a.content.bought!));

  // static Products productsRemoved() =>
  //     Map.fromEntries(_products.entries.where((element) => element.value.removed != null).toList()
  //       ..sort((a, b) => a.value.removed!.compareTo(b.value.removed!)));

  // static Product getProduct(ProductToken token) => products.singleWhere((product) => product.token == token);

  static Stream<Products> productsStream() => _productsRepository.productsStream('test 1');
}
