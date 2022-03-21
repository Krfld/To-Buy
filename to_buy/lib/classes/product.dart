import '../utils/logger.dart';
import './signature.dart';

typedef ProductToken = String;
typedef Products = List<Product>;

class Product implements Comparable<Product> {
  final ProductToken token;
  final ProductContent content;

  Product({
    required this.token,
    required this.content,
  });

  @override
  int compareTo(Product other) => content.compareTo(other.content);
}

class ProductContent implements Comparable<ProductContent> {
  String name;
  // String? brand;
  // String? store;
  String? description;
  // double? quantity;
  // String? amount;
  int? flag;
  Signature added;
  Signature? bought;
  // Signature? removed;

  ProductContent({
    required this.name,
    // this.brand,
    // this.store,
    this.description,
    // this.quantity,
    // this.amount,
    this.flag,
    required this.added,
    this.bought,
    // this.removed,
  });

  factory ProductContent.fromMap(Map product) {
    Map? bought = product['bought'];
    // Map? removed = product['removed'];

    return ProductContent(
      name: product['name'],
      // brand: product['brand'],
      // store: product['store'],
      description: product['description'],
      // quantity: product['quantity'],
      // amount: product['amount'],
      flag: product['flag'],
      added: Signature.fromMap(product['added']),
      bought: bought != null ? Signature.fromMap(bought) : null,
      // removed: removed != null ? Signature.fromMap(removed) : null,
    );
  }

  @override
  String toString() => 'Product($name, $description, ${added.timestamp}, ${bought?.timestamp})\n';

  @override
  int compareTo(other) => added.compareTo(other.added);
}
