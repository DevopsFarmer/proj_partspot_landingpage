
import 'package:partyspot/module/curated_events_list/data/models/curated_booked_response.dart';
import 'package:partyspot/module/curated_events_list/data/models/curated_event_list_response.dart';

abstract class CuratedEventsListRepository {
  Future<List<CuratedEventList?>?> getCuratedParties({required String? eventId});
  Future<CuratedBookedResponse?> bookCuratedParty({required String? eventId,required num? noOfGuest});
}
