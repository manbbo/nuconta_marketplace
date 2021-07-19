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
              bool canBeActive = false;
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new OfferView(
                  product: offer.product,
                  canBeActive: canBeActive,
                  onPressedFun: () {
                    if (this.widget.userBloc.subj.value.balance > 0 && offer.price <= this.widget.userBloc.subj.value.balance) {
                      setState(() {
                        this.widget.userBloc.buy(offer.price);
                        canBeActive = true;
                      });
                    } else {
                      setState(() {
                        canBeActive = true;
                      });

                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text("Insufficient funds"),
                          content: Text("You have insufficient funds for this purchase"),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: Text("okay"),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                );
              }));
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Container(child: Image.network(offer.product.image) //image,
                      ),
                  Text(offer.product.name, style: TextStyle(fontSize: 30),),
                  Text("Price: ${offer.price}", style: TextStyle(fontSize: 20, color: Colors.red),)
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
