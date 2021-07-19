import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuconta_marketplace/model/ProductModel.dart';

class OfferView extends StatelessWidget {
  final Product product;
  final Function onPressedFun;
  final bool canBeActive;

  OfferView({this.product, this.onPressedFun, this.canBeActive});

  Key getProductKey() {
    return Key(product.id);
  }

  Widget view(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: Directionality(
          key: getProductKey(),
          textDirection: TextDirection.ltr,
          child: Column(
            children: [
              Container(
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Container(child: Image.network(product.image) //image,
                  ),
              Text(product.name),
              Container(
                height: 200,
                child: SingleChildScrollView(
                  child: Text(product.description),
                ),
              ),
              AbsorbPointer(
                absorbing: canBeActive,
                child: Center(
                  child: FlatButton(
                    child: Text("BUY"),
                    onPressed: onPressedFun,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return view(context);
  }
}
