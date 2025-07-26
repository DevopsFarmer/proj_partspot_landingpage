import 'package:partyspot/module/home/data/models/banner_response_model.dart';
import 'package:partyspot/module/home/domain/repositories/home_repository.dart';
import 'package:partyspot/networking/api_urls.dart';
import 'package:partyspot/utils/services/part_spot_api_service.dart';

class HomeRepositoryImpl extends PartySportApiService implements HomeRepository {


  @override
  Future<BannerResponse?> getBannerData() async{
    final response = await getRequest(ApiUrl.carousel);
    return BannerResponse.fromJson(response.data);
  }
}