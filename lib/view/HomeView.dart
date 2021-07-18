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
                builder: (context, AsyncSnapshot<UserModel> userSnapshot) {
                  if (userSnapshot.hasData && userSnapshot.data.id != null) {
                    return Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Column(
                        children: [
                          AppBarView(userModel: userSnapshot.data),
                          Expanded(
                            child: Container(
                              child: StreamBuilder(
                                  stream: this.widget.offersBloc.subj.stream,
                                  builder: (context,
                                      AsyncSnapshot<List<OfferModel>>
                                          offerSnapshot) {
                                    if (offerSnapshot.hasData &&
                                        offerSnapshot.data[0].id != null) {
                                      return OfferListView(
                                          offers: offerSnapshot.data,
                                          context: context,
                                          userBloc: this.widget.userBloc);
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  }),
                            ),
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
