import 'package:get/get.dart';
import 'package:partyspot/module/curated_events_list/data/models/curated_event_list_response.dart';
import 'package:partyspot/module/curated_events_list/domain/repositories/curated_events_list_repository.dart';
import 'package:partyspot/networking/model/error_response_model.dart';
import 'package:partyspot/utils/classes/base_controller.dart';
import 'package:partyspot/utils/constants/service_const.dart';
import 'package:partyspot/utils/constants/string_consts.dart';

class CuratedEventsListController extends BaseController {

  final String? eventId;

  CuratedEventsListController({this.eventId});

  final CuratedEventsListRepository _curatedEventsListRepository = locator<CuratedEventsListRepository>();

  final RxList<CuratedEventList?> _curatedParties = <CuratedEventList?>[].obs;
  List<CuratedEventList?> get curatedParties => _curatedParties.toList();
  set curatedParties(List<CuratedEventList?> value) => _curatedParties.assignAll(value);


  @override
  void onInit() {
    super.onInit();
    fetchCuratedEvents();
  }

  Future<void> fetchCuratedEvents() async {
    try {
      setBusy(true);
      final res = await _curatedEventsListRepository.getCuratedParties(eventId: eventId);
      curatedParties = res ?? [];
    } on ErrorResponse catch (e) {
      setErrorMessage(e.message);
    } catch (e) {
      setErrorMessage(StringConsts.unExpectedError);
    } finally{
      setBusy(false);
    }
  }
}
