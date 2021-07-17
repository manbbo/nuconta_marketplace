import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nuconta_marketplace/model/OfferModel.dart';
import 'package:nuconta_marketplace/model/ProductModel.dart';
import 'package:nuconta_marketplace/model/UserModel.dart';
import 'package:nuconta_marketplace/view/AppBarView.dart';

import 'package:nuconta_marketplace/view/HomeView.dart';

UserModel getMockedUser() {
  return new UserModel(
      id: "01231",
      name: "John", balance: 10
  );
}

void main() {
  testWidgets('Testing if the AppView shows up properly',
          (WidgetTester tester) async {

    // Build our app and trigger a frame.
    await tester.pumpWidget(AppBarView().userBanner(getMockedUser()));

    expect(find.widgetWithText(Row, "Hello, ${getMockedUser().name}! Your balance is ${getMockedUser().balance}"), findsOneWidget);


    //await tester.tap(find.byIcon(Icons.add));
    //await tester.pump();

    // Verify that our counter has incremented.
    //expect(find.text('0'), findsNothing);
    //expect(find.text('1'), findsOneWidget);
  });
}
