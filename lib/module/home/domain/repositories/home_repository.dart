
import 'package:partyspot/module/home/data/models/banner_response_model.dart';

abstract class HomeRepository {
  Future<BannerResponse?> getBannerData();
}
