import 'package:flutter/cupertino.dart';
import 'package:nuconta_marketplace/controller/UserBloc.dart';
import 'package:nuconta_marketplace/model/UserModel.dart';

class AppBarView {
  var userBloc = UserBloc();

  AppBarView() {
    userBloc.createUser();
  }

  Widget userBanner(UserModel user) {
    return Container(
      height: 50,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        textDirection: TextDirection.ltr,
        children: [
          Text("Hello, ${user.name}! Your balance is ${user.balance}",
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.center)
        ],
      ),
    );
  }
}