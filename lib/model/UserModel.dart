import 'package:flutter/widgets.dart';

class UserModel {
  final String id;
  final String name;
  int balance;
  final String __typename;

  //<editor-fold desc="Data Methods" defaultstate="collapsed">

  UserModel({
    @required this.id,
    @required this.name,
    @required this.balance,
    @required String typename,
  }) : __typename = typename;

  UserModel copyWith({
    String id,
    String name,
    int balance,
    String typename,
  }) {
    return new UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      balance: balance ?? this.balance,
      typename: typename ?? this.__typename,
    );
  }

  @override
  String toString() {
    return 'UserModel{id: $id, name: $name, balance: $balance, __typename: $__typename}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          balance == other.balance &&
          __typename == other.__typename);

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ balance.hashCode ^ __typename.hashCode;

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return new UserModel(
      id: map.entries.last.value['id'] as String,
      name: map.entries.last.value['name'] as String,
      balance: map.entries.last.value['balance'] as int,
      typename: map.entries.last.value['__typename'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'name': this.name,
      'balance': this.balance,
      '__typename': this.__typename,
    } as Map<String, dynamic>;
  }

  //</editor-fold>

}
