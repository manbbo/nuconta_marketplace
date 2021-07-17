import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nuconta_marketplace/constants/APICalls.dart';
import 'package:nuconta_marketplace/controller/OfferBloc.dart';
import 'package:nuconta_marketplace/controller/UserBloc.dart';
import 'package:nuconta_marketplace/model/OfferModel.dart';
import 'package:nuconta_marketplace/model/UserModel.dart';
import 'package:nuconta_marketplace/view/AppBarView.dart';
import 'package:nuconta_marketplace/view/OffersListView.dart';

class HomeView extends StatefulWidget {
  final UserBloc userBloc = UserBloc();
  final OffersBloc offersBloc = OffersBloc();

  HomeView() {
    userBloc.createUser();
    offersBloc.createOffers();
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
                  if (snapshot.hasData && snapshot.data.id != null) {
                    return Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Row(
                        children: [
                          AppBarView().userBanner(snapshot.data),
                          StreamBuilder(
                            stream: this.widget.offersBloc.subj.stream,
                              builder: (context, AsyncSnapshot<List<OfferModel>> snapshot) {
                                return OfferListView(offers: snapshot.data).listView(null);
                              }
                          )
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
            )));
  }
}
