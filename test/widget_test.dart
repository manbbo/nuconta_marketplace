import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:nuconta_marketplace/constants/APICalls.dart';
import 'package:nuconta_marketplace/model/OfferModel.dart';
import 'package:nuconta_marketplace/model/ProductModel.dart';
import 'package:nuconta_marketplace/model/UserModel.dart';
import 'package:nuconta_marketplace/view/AppBarView.dart';

import 'package:nuconta_marketplace/view/HomeView.dart';
import 'package:nuconta_marketplace/view/OffersListView.dart';

UserModel getMockedUser() {
  return new UserModel(id: "01231", name: "John", balance: 10);
}

Future<UserModel> getUserResponse() {
  return API().getUserResult();
}

List<OfferModel> getMockedOffers() {
  return [
    OfferModel(
        id: '1',
        price: 1,
        product: Product(
            id: "0",
            description: "Hi, I'm a product!",
            image:
                "https://images.pexels.com/photos/462118/pexels-photo-462118.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
            name: "Portal gun 1"),
        p_typename: null),
    OfferModel(
        id: '2',
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
    await tester.pumpWidget(AppBarView().userBanner(getMockedUser()));
    expect(
        find.widgetWithText(Row,
            "Hello, ${getMockedUser().name}! Your balance is ${getMockedUser().balance}"),
        findsOneWidget);

    //await tester.tap(find.byIcon(Icons.add));
    //await tester.pump();

    // Verify that our counter has incremented.
    //expect(find.text('0'), findsNothing);
    //expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Testing if the OfferListView shows up properly',
      (WidgetTester tester) async {
    await mockNetworkImagesFor(() => tester
        .pumpWidget(OfferListView(offers: getMockedOffers()).listView(null)));

    expect(find.widgetWithText(Column, "Hi, I'm a product!"), findsOneWidget);
    expect(find.widgetWithText(Column, "Portal gun 1"), findsOneWidget);
    expect(find.widgetWithText(Column, "1"), findsOneWidget);

//await tester.tap(find.byIcon(Icons.add));
//await tester.pump();

// Verify that our counter has incremented.
//expect(find.text('0'), findsNothing);
//expect(find.text('1'), findsOneWidget);
  });
}
