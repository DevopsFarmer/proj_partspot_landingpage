import 'package:get/get.dart';
import 'package:partyspot/module/curated_events_list/data/models/curated_event_list_response.dart';
import 'package:partyspot/module/explore/domain/repositories/explore_repository.dart';
import 'package:partyspot/networking/api_urls.dart';
import 'package:partyspot/utils/services/part_spot_api_service.dart';

class ExploreRepositoryImpl extends PartySportApiService implements ExploreRepository {


  @override
  Future<CuratedPartyListResponse?> getEvents({required String eventType,required int? page,required int? limit,String? location,num? minPrice,num? maxPrice,String? themeId,num? month,String? searchKey}) async{
    final response = await getRequest(ApiUrl.eventsGet + '/' + eventType,queryParams: {
      "page": page,
      "limit": limit,
      if(searchKey?.isNotEmpty ?? false) "searchKey": searchKey,
      if(location?.isNotEmpty ?? false) "location": location,
      if(minPrice?.isGreaterThan(0) ?? false) "minPrice": minPrice,
      if(maxPrice?.isGreaterThan(0) ?? false) "maxPrice": maxPrice,
      if(themeId?.isNotEmpty ?? false) "themeId": themeId,
      if(month?.isGreaterThan(-1) ?? false) "month": month
    });
    return CuratedPartyListResponse.fromJson(response.data);
  }
}