import 'package:flutter/cupertino.dart';
import 'package:nuconta_marketplace/model/UserModel.dart';

class AppBarView extends StatefulWidget {
  final UserModel userModel;

  AppBarView({this.userModel});

  @override
  _AppBarViewState createState() => _AppBarViewState();
}

class _AppBarViewState extends State<AppBarView> {
  Widget userBanner() {
    var user = this.widget.userModel;

    return Container(
        height: 50,
        child: Column(
          children: [
            Text("Hello, ${user.name}!",
                textDirection: TextDirection.ltr, textAlign: TextAlign.center),
            Text("Your balance is ${user.balance}",
                textDirection: TextDirection.ltr, textAlign: TextAlign.center),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return userBanner();
  }
}
