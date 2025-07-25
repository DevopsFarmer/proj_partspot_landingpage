
import 'package:partyspot/module/curated_events_list/data/models/curated_booked_response.dart';
import 'package:partyspot/module/curated_events_list/data/models/curated_event_list_response.dart';

abstract class CuratedEventsListRepository {
  Future<CuratedPartyListResponse?> getCuratedParties({required String? eventId,int? page,int? limit});
  Future<CuratedBookedResponse?> bookCuratedParty({required String? eventId,required num? noOfGuest});
}
