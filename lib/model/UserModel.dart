import 'package:flutter/widgets.dart';
import 'package:nuconta_marketplace/model/OfferModel.dart';

class UserModel {
  final String id;
  final String name;
  int balance;

  UserModel({
    @required this.id,
    @required this.name,
    @required this.balance,
    @required this.offers,
  });

  UserModel copyWith({
    String id,
    String name,
    int balance,
    List<Offer> offers,
  }) {
    return new UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      balance: balance ?? this.balance,
      offers: offers ?? this.offers,
    );
  }

  @override
  String toString() {
    return 'UserModel{id: $id, name: $name, balance: $balance, offers: $offers}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          balance == other.balance &&
          offers == other.offers);

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ balance.hashCode ^ offers.hashCode;

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return new UserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      balance: map['balance'] as int,
      offers: map['offers'] as List<Offer>,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'name': this.name,
      'balance': this.balance,
      'offers': this.offers,
    } as Map<String, dynamic>;
  }

  final List<Offer> offers;
}
