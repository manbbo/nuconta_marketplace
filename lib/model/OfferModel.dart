import 'package:flutter/widgets.dart';
import 'package:nuconta_marketplace/model/ProductModel.dart';

class OfferModel {
  final String id;

  //<editor-fold desc="Data Methods" defaultstate="collapsed">

  const OfferModel({
    @required this.id,
    @required this.price,
    @required this.product,
    @required String p_typename,
  }) : __typename = p_typename;

  OfferModel copyWith({
    String id,
    int price,
    String p_typename,
    Product product,
  }) {
    if ((id == null || identical(id, this.id)) &&
        (price == null || identical(price, this.price)) &&
        (p_typename == null || identical(p_typename, this.__typename)) &&
        (product == null || identical(product, this.product))) {
      return this;
    }

    return new OfferModel(
      id: id ?? this.id,
      price: price ?? this.price,
      p_typename: p_typename ?? this.__typename,
      product: product ?? this.product,
    );
  }

  @override
  String toString() {
    return 'OfferModel{id: $id, price: $price, __typename: $__typename, product: $product}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OfferModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          price == other.price &&
          __typename == other.__typename &&
          product == other.product);

  @override
  int get hashCode =>
      id.hashCode ^ price.hashCode ^ __typename.hashCode ^ product.hashCode;

  factory OfferModel.fromMap(Map<String, dynamic> map) {
    return new OfferModel(
      id: map['id'] as String,
      price: map['price'] as int,
      p_typename: map['__typename'] as String,
      product: Product.fromMap(map.entries.last.value),
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'price': this.price,
      '__typename': this.__typename,
      'product': this.product,
    } as Map<String, dynamic>;
  }

  //</editor-fold>

  final int price;
  final String __typename;
  final Product product;
}
