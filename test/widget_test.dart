import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:nuconta_marketplace/constants/APICalls.dart';
import 'package:nuconta_marketplace/model/OfferModel.dart';
import 'package:nuconta_marketplace/model/ProductModel.dart';
import 'package:nuconta_marketplace/model/UserModel.dart';
import 'package:nuconta_marketplace/view/AppBarView.dart';

import 'package:nuconta_marketplace/view/OfferView.dart';

UserModel getMockedUser() {
  return new UserModel(id: "01231", name: "John", balance: 10);
}

Future<UserModel> getUserResponse() {
  return API().getUserResult();
}

List<OfferModel> getMockedOffers() {
  return [
    OfferModel(
        id: 'first',
        price: 1,
        product: Product(
            id: "0",
            description: "Hi, I'm a product!",
            image:
                "https://images.pexels.com/photos/462118/pexels-photo-462118.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
            name: "Portal gun 1"),
        p_typename: null),
    OfferModel(
        id: 'second',
        price: 2,
        product: Product(
            id: "3",
            description: "Hi, I'm a product?",
            image:
                "https://images.pexels.com/photos/462118/pexels-photo-462118.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
            name: "Portal gun 2"),
        p_typename: null)
  ];
}

void main() {
  testWidgets('Testing if the AppBarView shows up properly',
      (WidgetTester tester) async {
    await tester.pumpWidget(AppBarView(userModel: getMockedUser()));
    expect(find.widgetWithText(Column, "Hello, ${getMockedUser().name}!"),
        findsOneWidget);

    expect(
        find.widgetWithText(
            Column, "Your balance is ${getMockedUser().balance}"),
        findsOneWidget);
    //expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Testing if the OfferListView shows up properly',
      (WidgetTester tester) async {
    await mockNetworkImagesFor(
        () => tester.pumpWidget(AppBarView(userModel: getMockedUser())));

    expect(find.widgetWithText(Row, "Portal gun 1"), findsOneWidget);
    expect(find.widgetWithText(Row, "Price: 1"), findsOneWidget);
  });

  testWidgets('Testing if the OfferView shows up properly',
      (WidgetTester tester) async {
    await mockNetworkImagesFor(() => tester.pumpWidget(
        OfferView(product: getMockedOffers()[0].product).view(null)));

    expect(find.widgetWithText(Row, "Hi, I'm a product!"), findsOneWidget);
    expect(find.widgetWithText(Row, "Portal gun 1"), findsOneWidget);
    expect(find.widgetWithText(FlatButton, "BUY"), findsOneWidget);
  });
}
