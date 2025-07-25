import 'package:flutter/material.dart';
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

  final ScrollController scrollController = ScrollController();

  int _currentPage = 1;
  final int _pageLimit = 20;

  final RxBool _hasMoreData = true.obs;
  bool get hasMoreData => _hasMoreData.value;
  set hasMoreData(bool value) => _hasMoreData.value = value;


  final RxList<Datum?> _curatedParties = <Datum?>[].obs;
  List<Datum?> get curatedParties => _curatedParties.toList();
  set curatedParties(List<Datum?> value) => _curatedParties.assignAll(value);


  @override
  void onInit() {
    super.onInit();
    fetchCuratedEvents();
    scrollController.addListener(scrollListener);
  }

  void scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent && hasMoreData) {
      loadMore();
    }
  }

  Future<void> fetchCuratedEvents({int page = 1, bool loadMore = false}) async {
    // try {
    //   setBusy(true);
    //   final res = await _curatedEventsListRepository.getCuratedParties(eventId: eventId);
    //   curatedParties = res?.data ?? [];

    if (!hasMoreData) return;

    try {
      setErrorMessage('');
      if (!loadMore) setBusy(true);

      final res = await _curatedEventsListRepository.getCuratedParties(
        eventId: eventId,
        page: page,
        limit: _pageLimit,
      );

      if (res != null && res.data != null) {
        final results = res.data ?? [];
        if (results.length < _pageLimit) {
          hasMoreData = false;
        } else {
          _currentPage++;
        }
        _curatedParties.addAll(results);

      }
    } on ErrorResponse catch (e) {
      setErrorMessage(e.message);
    } catch (e) {
      setErrorMessage(StringConsts.unExpectedError);
    } finally{
      setBusy(false);
    }
  }


  void loadMore() {
    if (!isBusy && hasMoreData) {
      fetchCuratedEvents(page: _currentPage, loadMore: true);
    }
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }
}
