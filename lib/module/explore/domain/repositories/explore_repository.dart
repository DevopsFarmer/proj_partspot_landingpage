import 'package:partyspot/module/curated_events_list/data/models/curated_event_list_response.dart';

abstract class ExploreRepository {
  Future<CuratedPartyListResponse?> getEvents({required String eventType,required int? page,required int? limit,String? location,num? minPrice,num? maxPrice,String? themeId,num? month,String? searchKey});
}
