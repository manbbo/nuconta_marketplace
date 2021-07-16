import 'package:flutter/widgets.dart';
import 'package:nuconta_marketplace/model/ProductModel.dart';

class Offer {
  final String id;
  final int price;

  const Offer({
    @required this.id,
    @required this.price,
    @required this.product,
  });

  Offer copyWith({
    String id,
    int price,
    Product product,
  }) {
    if ((id == null || identical(id, this.id)) &&
        (price == null || identical(price, this.price)) &&
        (product == null || identical(product, this.product))) {
      return this;
    }

    return new Offer(
      id: id ?? this.id,
      price: price ?? this.price,
      product: product ?? this.product,
    );
  }

  @override
  String toString() {
    return 'Offer{id: $id, price: $price, product: $product}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Offer &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          price == other.price &&
          product == other.product);

  @override
  int get hashCode => id.hashCode ^ price.hashCode ^ product.hashCode;

  factory Offer.fromMap(Map<String, dynamic> map) {
    return new Offer(
      id: map['id'] as String,
      price: map['price'] as int,
      product: map['product'] as Product,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'price': this.price,
      'product': this.product,
    } as Map<String, dynamic>;
  }

  final Product product;
}