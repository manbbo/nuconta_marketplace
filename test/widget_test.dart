import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nuconta_marketplace/view/HomeView.dart';

void main() {
  testWidgets('Testing if the widget shows up', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(HomeView());

    expect(find.text('Hello'), findsOneWidget);
    expect(find.text('Hello'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    //await tester.tap(find.byIcon(Icons.add));
    //await tester.pump();

    // Verify that our counter has incremented.
    //expect(find.text('0'), findsNothing);
    //expect(find.text('1'), findsOneWidget);
  });
}
