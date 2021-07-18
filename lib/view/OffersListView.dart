import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuconta_marketplace/controller/UserBloc.dart';
import 'package:nuconta_marketplace/model/OfferModel.dart';
import 'package:nuconta_marketplace/view/OfferView.dart';

class OfferListView extends StatefulWidget {
  final List<OfferModel> offers;
  final BuildContext context;
  final UserBloc userBloc;

  OfferListView({this.offers, this.context, this.userBloc});

  @override
  _OfferListViewState createState() => _OfferListViewState();
}

class _OfferListViewState extends State<OfferListView> {
  Key getOfferKey(int index) {
    return Key(widget.offers[index].id);
  }

  Widget listView() {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: ListView.builder(
        itemCount: widget.offers.length,
        itemBuilder: (BuildContext context, int index) {
          var offer = widget.offers[index];
          var gKey = getOfferKey(index);
          return GestureDetector(
            key: gKey,
            onTap: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new OfferView(
                  product: offer.product,
                  onPressedFun: () {
                    if (this.widget.userBloc.subj.value.balance > 0) {
                      setState(() {
                        this.widget.userBloc.buy(offer.price);
                      });
                    }
                  },
                );
              }));
            },
            child: Container(
              child: Column(
                children: [
                  Container(child: Image.network(offer.product.image) //image,
                      ),
                  Text(offer.product.name),
                  Text("Price: ${offer.price}")
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return listView();
  }
}
