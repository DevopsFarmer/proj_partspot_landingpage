import 'package:get/get.dart';
import 'package:partyspot/module/app_entry/domain/app_entry_repository.dart';
import 'package:partyspot/module/curated_events_list/data/models/curated_booked_response.dart';
import 'package:partyspot/module/curated_events_list/domain/repositories/curated_events_list_repository.dart';
import 'package:partyspot/module/app_entry/data/models/events_meta.dart';
import 'package:partyspot/networking/model/error_response_model.dart';
import 'package:partyspot/utils/classes/base_controller.dart';
import 'package:partyspot/utils/constants/service_const.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/loader.dart';
import 'package:partyspot/utils/widgets/snackbars.dart';

class CuratedEventInfoController extends BaseController {

  num noOfGuest = 1;

  CuratedEventInfoController();

  final CuratedEventsListRepository _curatedEventsListRepository = locator<CuratedEventsListRepository>();
  final AppEntryRepository _appEntryRepository = locator<AppEntryRepository>();

  final Rxn<EventsMetaDataResponse?> _eventMetaData = Rxn<EventsMetaDataResponse?>();
  EventsMetaDataResponse? get eventMetaData => _eventMetaData.value;
  set eventMetaData(EventsMetaDataResponse? busy) {
    _eventMetaData.value = busy;
  }

  final Rxn<PartyTheme?> _partyTheme = Rxn<PartyTheme?>();
  PartyTheme? get partyTheme => _partyTheme.value;
  set partyTheme(PartyTheme? busy) {
    _partyTheme.value = busy;
  }


  @override
  Future<void> onInit() async {
    super.onInit();
    getMetaData();
    ever<String>(errorMessageRx, (String msg) {
      Future.microtask((){
        if (msg.isNotEmpty) {
          showSnackBar(text: errorMessage, isError: true);
          setErrorMessage('');
        }
      });
    });
  }

  Future<void> bookEvent({String? eventId,Function(AssignedAgent? assignedAgent)? onSuccess}) async {
    try {
      FullScreenLoading.show();
      final res = await _curatedEventsListRepository.bookCuratedParty(noOfGuest: noOfGuest,eventId: eventId);
      FullScreenLoading.hide();
      onSuccess?.call(res?.booking?.assignedAgent);
    } on ErrorResponse catch (e) {
      setErrorMessage(e.message);
    } catch (e) {
      setErrorMessage(StringConsts.unExpectedError);
    } finally{
      FullScreenLoading.hide();
    }
  }

  Future<void> getMetaData({void Function()? onSuccess}) async {
    try {
      setBusy(true);
      update();
      eventMetaData = await _appEntryRepository.getEventMetaData();
      onSuccess?.call();
    } on ErrorResponse catch (e) {
      setErrorMessage(e.message);
    } catch (e) {
      setErrorMessage(StringConsts.unExpectedError);
    } finally{
      setBusy(false);
      update();
    }
  }
}
