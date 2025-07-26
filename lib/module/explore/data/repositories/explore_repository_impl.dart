import 'package:partyspot/module/curated_events_list/data/models/curated_event_list_response.dart';
import 'package:partyspot/module/explore/domain/repositories/explore_repository.dart';
import 'package:partyspot/networking/api_urls.dart';
import 'package:partyspot/utils/services/part_spot_api_service.dart';

class ExploreRepositoryImpl extends PartySportApiService implements ExploreRepository {


  @override
  Future<CuratedPartyListResponse?> getEvents({int? page,int? limit,String? location,num? minPrice,num? maxPrice,String? themeName,num? month}) async{
    final response = await getRequest(ApiUrl.events,queryParams: {
      "page": page,
      "limit": limit,
      "location": location,
      "minPrice": minPrice,
      "maxPrice": maxPrice,
      "themeName": themeName,
      "month": month
    });
    return CuratedPartyListResponse.fromJson(response.data);
  }
}