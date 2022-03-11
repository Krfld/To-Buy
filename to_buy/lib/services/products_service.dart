import '../repositories/products_repository.dart';
import '../classes/product.dart';

class ProductsService {
  static final ProductsRepository _productsRepository = ProductsRepositoryCloudFirestore();

  static final Products _products = {}; // Order by added date

  static Products productsToBuy() {
    Products products = Map.of(_products);
    products.removeWhere((key, value) => value.bought != null);
    return products;
  }

  static Products productsBought() {
    Products products = Map.of(_products);
    products.removeWhere((key, value) => value.bought == null);
    return products;
  }

  // static Products productsRemoved() {
  //   Products products = Map.of(_products);
  //   products.removeWhere((key, value) => value.removed == null);
  //   return products;
  // }

  static Product getProduct(String productId) => _products[productId]!;
}
