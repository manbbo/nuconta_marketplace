import 'package:flutter_test/flutter_test.dart';
import 'package:nuconta_marketplace/constants/APICalls.dart';
import 'package:nuconta_marketplace/model/UserModel.dart';

void main() {
  group("Fetch User", () {
    test("If Fetch worked and data exists", () async {
      var user = await API().getUserResult();
      expect(user, isA<UserModel>());
      expect(user, isNotNull);

      var offers = await API().getOffersResult();
      expect(offers, isNotNull);
      expect(offers[0].price, isNotNull);
    });
  });
}
