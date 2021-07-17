import 'package:flutter/cupertino.dart';
import 'package:nuconta_marketplace/model/OfferModel.dart';

class OfferListView {
  final List<OfferModel> offers;

  OfferListView ({this.offers});

  Key getProductKey(int index) {
    return Key(offers[index].product.id);
  }

  Widget listView(Function listener) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: ListView.builder(
        itemCount: offers.length,
        itemBuilder: (BuildContext context, int index) {
          var offer = offers[index];
          var gKey = Key(offer.id);
          return GestureDetector(
            key: gKey,
            onTap: listener,
            child: Container(
              child: Row(
                children: [
                  Container(
                      child: Image.network(offer.product.image)//image,
                  ),Column(
                    children: [
                      Text(offer.product.name),
                      Text(offer.product.description),
                      Text("${offer.price}")
                    ],
                  )
                ],),
            ),
          );
        },
      ),
    );
  }
}