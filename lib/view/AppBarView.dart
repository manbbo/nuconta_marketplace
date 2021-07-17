import 'package:flutter/cupertino.dart';
import 'package:nuconta_marketplace/controller/UserBloc.dart';
import 'package:nuconta_marketplace/model/UserModel.dart';

class AppBarView extends StatelessWidget {
  var userBloc = UserBloc();

  AppBarView() {
    userBloc.createUser();
  }

  @override
  Widget build(BuildContext context) {
    return this.userBanner(userBloc.subj.value);
  }

  Widget userBanner(UserModel user) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      textDirection: TextDirection.ltr,
      children: [
        Text("Hello, ${user.name}! Your balance is ${user.balance}",
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center)
      ],
    );
  }
}