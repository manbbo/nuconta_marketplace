import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:nuconta_marketplace/constants/APICalls.dart';
import 'package:nuconta_marketplace/model/UserModel.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc extends BlocBase {
  BehaviorSubject<UserModel> subject = BehaviorSubject<UserModel>();

  UserModel user;

  createUser() async {
    user = await API().getUserResult();
    subject.sink.add(user);
  }

  @override
  void dispose() {
    super.dispose();
    subject.close();
  }

  BehaviorSubject<UserModel> get subj => subject;
}
