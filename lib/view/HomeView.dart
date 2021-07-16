import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nuconta_marketplace/constants/APICalls.dart';
import 'package:nuconta_marketplace/model/UserModel.dart';

class HomeView extends StatefulWidget {
  Widget userBanner(UserModel user) {
    return new Row(
      children: [
        Text(
            "Hello, ${user.name}! Your balance is ${user.balance}",
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center)
      ],
    );
  }

  Widget offerList(UserModel user) {

  }

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Widget homeViewWidget() {
    return GraphQLProvider(
      client: ValueNotifier(API().getClient()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: new Scaffold(
          appBar: null,
          body: FutureBuilder(
            future: API().getResult(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return this.widget.userBanner(snapshot.data as UserModel);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
            //initialData: ,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return homeViewWidget();
  }


}
