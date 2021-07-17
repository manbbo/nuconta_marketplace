import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nuconta_marketplace/constants/APICalls.dart';
import 'package:nuconta_marketplace/controller/UserBloc.dart';
import 'package:nuconta_marketplace/model/UserModel.dart';
import 'package:nuconta_marketplace/view/AppBarView.dart';

class HomeView extends StatefulWidget {
  final UserBloc userBloc = UserBloc();

  HomeView() {
    userBloc.createUser();
  }

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
        client: ValueNotifier(API().getClient()),
        child: MaterialApp(
          title: 'NuConta Marketplace',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
            home: new Scaffold(
              appBar: null,
              body: StreamBuilder(
                stream: this.widget.userBloc.subj.stream,
                builder: (context, AsyncSnapshot<UserModel> snapshot) {
                  if (snapshot.hasData && snapshot.data.id!= null){
                    return Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Column(
                        children: [
                          AppBarView()
                              .userBanner(snapshot.data)
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            )
        )
    );
  }

}


