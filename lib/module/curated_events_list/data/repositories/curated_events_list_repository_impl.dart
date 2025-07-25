

import 'package:partyspot/module/curated_events_list/data/models/curated_booked_response.dart';
import 'package:partyspot/module/curated_events_list/data/models/curated_event_list_response.dart';
import 'package:partyspot/module/curated_events_list/domain/repositories/curated_events_list_repository.dart';
import 'package:partyspot/networking/api_urls.dart';
import 'package:partyspot/utils/services/part_spot_api_service.dart';

class CuratedEventsRepositoryImpl extends PartySportApiService implements CuratedEventsListRepository {
  @override
  Future<CuratedPartyListResponse?> getCuratedParties({required String? eventId,int? page,int? limit}) async{
    final response = await getRequest('${ApiUrl.eventsGet}/$eventId');
    return CuratedPartyListResponse.fromJson(response.data);
  }

  @override
  Future<CuratedBookedResponse?> bookCuratedParty({required String? eventId,required num? noOfGuest}) async{
    final response = await postRequest('${ApiUrl.eventBook(eventId)}',data: {"guests":noOfGuest});
    return CuratedBookedResponse.fromJson(response.data);
  }

}
