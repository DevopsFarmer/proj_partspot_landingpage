import 'package:partyspot/module/app_entry/domain/app_entry_repository.dart';
import 'package:partyspot/module/app_entry/data/models/events_meta.dart';
import 'package:partyspot/networking/api_urls.dart';
import 'package:partyspot/utils/services/part_spot_api_service.dart';

class AppEntryRepositoryImpl extends PartySportApiService implements AppEntryRepository {

  @override
  Future<EventsMetaDataResponse?> getEventMetaData() async{
    final response = await getRequest(ApiUrl.eventsMetaData);
    return EventsMetaDataResponse.fromJson(response.data);
  }

}