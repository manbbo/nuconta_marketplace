import 'package:flutter_test/flutter_test.dart';
import 'package:nuconta_marketplace/constants/APICalls.dart';
import 'package:nuconta_marketplace/model/UserModel.dart';

void main() {
  group("Fetch Users", () {
    test("If users exists", () async {
      expect(await API().getResult(), isA<UserModel>());
    });
  });
}
