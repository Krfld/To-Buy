import '../repositories/products_repository.dart';
import '../classes/product.dart';

class ProductsService {
  static final ProductsRepository _productsRepository = ProductsRepositoryCloudFirestore();

  static final Map<String, Product> products = {};

  static Product getProduct(String productId) => products[productId]!;
}
