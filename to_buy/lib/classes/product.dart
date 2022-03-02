import './signature.dart';

class Product implements Comparable<Product> {
  String name;
  String? brand;
  String? store;
  String? description;
  double? quantity;
  String? unit;
  int? flag;
  Signature added;
  Signature? bought;
  Signature? removed;

  Product({
    required this.name,
    this.brand,
    this.store,
    this.description,
    this.quantity,
    this.unit,
    this.flag,
    required this.added,
    this.bought,
    this.removed,
  });

  factory Product.fromMap(Map product) {
    Map? bought = product['bought'];
    Map? removed = product['removed'];

    return Product(
      name: product['name'],
      brand: product['brand'],
      store: product['store'],
      description: product['description'],
      quantity: product['quantity'],
      unit: product['unit'],
      flag: product['flag'],
      added: Signature.fromMap(product['added']),
      bought: bought != null ? Signature.fromMap(bought) : null,
      removed: removed != null ? Signature.fromMap(removed) : null,
    );
  }

  @override
  int compareTo(other) => added.compareTo(other.added);
}
