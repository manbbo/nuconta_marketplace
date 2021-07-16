import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nuconta_marketplace/constants/APICalls.dart';
import 'package:nuconta_marketplace/model/UserModel.dart';

class HomeView extends StatelessWidget {
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
                return UserBanner(snapshot.data as UserModel);
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

  Widget UserBanner(UserModel user) {
    return new Column(
      children: [
        new Row(
          children: [
            Text("Hello, \n${user.name}! Your balance is \$${user.balance}"),
          ],
        )
      ],
    );
  }
}