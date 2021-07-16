import 'package:flutter/widgets.dart';

class Product {
  final String id;

  const Product({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.image,
  });

  Product copyWith({
    String id,
    String name,
    String description,
    String image,
  }) {
    if ((id == null || identical(id, this.id)) &&
        (name == null || identical(name, this.name)) &&
        (description == null || identical(description, this.description)) &&
        (image == null || identical(image, this.image))) {
      return this;
    }

    return new Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }

  @override
  String toString() {
    return 'Product{id: $id, name: $name, description: $description, image: $image}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          description == other.description &&
          image == other.image);

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ description.hashCode ^ image.hashCode;

  factory Product.fromMap(Map<String, dynamic> map) {
    return new Product(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'name': this.name,
      'description': this.description,
      'image': this.image,
    } as Map<String, dynamic>;
  }

  final String name;
  final String description;
  final String image;
}