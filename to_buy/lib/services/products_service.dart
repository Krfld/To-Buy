import '../repositories/products_repository.dart';
import '../classes/product.dart';

class ProductsService {
  static final ProductsRepository _productsRepository = ProductsRepositoryCloudFirestore();

  static final Map<String, Product> _products = {}; // Order by added date

  static Map<String, Product> productsToBuy() {
    Map<String, Product> products = Map.from(_products);
    products.removeWhere((key, value) => value.bought != null);
    return products;
  }

  static Map<String, Product> productsBought() {
    Map<String, Product> products = Map.from(_products);
    products.removeWhere((key, value) => value.bought == null);
    return products;
  }

  static Map<String, Product> productsRemoved() {
    Map<String, Product> products = Map.from(_products);
    products.removeWhere((key, value) => value.removed == null);
    return products;
  }

  static Product getProduct(String productId) => _products[productId]!;
}
