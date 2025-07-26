import 'package:partyspot/module/app_entry/data/models/events_meta.dart';

abstract class AppEntryRepository {
  Future<EventsMetaDataResponse?> getEventMetaData();
}
