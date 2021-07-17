import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:nuconta_marketplace/constants/APICalls.dart';
import 'package:nuconta_marketplace/model/OfferModel.dart';
import 'package:rxdart/rxdart.dart';

class OffersBloc extends BlocBase {
  BehaviorSubject<List<OfferModel>> subject = BehaviorSubject<List<OfferModel>>();

  List<OfferModel> Offers;

  createOffers() async {
    Offers = await API().getOffersResult();
    subject.sink.add(Offers);
  }

  @override
  void dispose() {
    super.dispose();
    subject.close();
  }

  BehaviorSubject<List<OfferModel>> get subj => subject;
}