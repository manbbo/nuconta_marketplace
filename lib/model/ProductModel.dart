import 'package:flutter/widgets.dart';

class Product {
  final String id;
  final String __typename;

  //<editor-fold desc="Data Methods" defaultstate="collapsed">

  const Product({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.image,
    @required String typename,
  }) : __typename = typename;

  Product copyWith({
    String id,
    String typename,
    String name,
    String description,
    String image,
  }) {
    if ((id == null || identical(id, this.id)) &&
        (typename == null || identical(typename, this.__typename)) &&
        (name == null || identical(name, this.name)) &&
        (description == null || identical(description, this.description)) &&
        (image == null || identical(image, this.image))) {
      return this;
    }

    return new Product(
      id: id ?? this.id,
      typename: typename ?? this.__typename,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }

  @override
  String toString() {
    return 'Product{id: $id, __typename: $__typename, name: $name, description: $description, image: $image}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          __typename == other.__typename &&
          name == other.name &&
          description == other.description &&
          image == other.image);

  @override
  int get hashCode =>
      id.hashCode ^
      __typename.hashCode ^
      name.hashCode ^
      description.hashCode ^
      image.hashCode;

  factory Product.fromMap(Map<String, dynamic> map) {
    return new Product(
      id: map['id'] as String,
      typename: map['__typename'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      '__typename': this.__typename,
      'name': this.name,
      'description': this.description,
      'image': this.image,
    } as Map<String, dynamic>;
  }

  //</editor-fold>

  final String name;
  final String description;
  final String image;
}