import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/module/app_entry/data/models/events_meta.dart';
import 'package:partyspot/module/app_entry/presentation/controller/app_entry_controller.dart';
import 'package:partyspot/module/explore/domain/repositories/explore_repository.dart';
import 'package:partyspot/networking/model/error_response_model.dart';
import 'package:partyspot/utils/classes/base_controller.dart';
import 'package:partyspot/utils/constants/app_enums.dart';
import 'package:partyspot/utils/constants/service_const.dart';
import 'package:partyspot/utils/constants/string_consts.dart';

import '../../../curated_events_list/data/models/curated_event_list_response.dart';

class ExploreController extends BaseController {

  final ExploreRepository _exploreRepository = locator<ExploreRepository>();
  final AppEntryController _appEntryController = Get.find<AppEntryController>();

  Timer? _debounce;

  final Rxn<PartyTheme?> _partyTheme = Rxn<PartyTheme?>();
  PartyTheme? get partyTheme => _partyTheme.value;
  set partyTheme(PartyTheme? busy) {
    _partyTheme.value = busy;
  }

  final Rxn<num?> _minPrice = Rxn<num?>();
  num? get minPrice => _minPrice.value;
  set minPrice(num? val) {
    _minPrice.value = val;
  }

  final Rxn<num?> _maxPrice = Rxn<num?>();
  num? get maxPrice => _maxPrice.value;
  set maxPrice(num? val) {
    _maxPrice.value = val;
  }

  final Rxn<Map<String, dynamic>?> _month = Rxn<Map<String, dynamic>>();
  Map<String, dynamic>? get month => _month.value;
  set month(Map<String, dynamic>? val) {
    _month.value = val;
  }

  final Rxn<String?> _searchKey = Rxn<String?>();
  String? get searchKey => _searchKey.value;
  set searchKey(String? val) {
    _searchKey.value = val;
  }

  onChangedSearch(String val){
    searchKey = '';
    update();
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async{
      searchKey = val;
      resetAndFetchCuratedEvents();
    });
  }



  List<String> areaList = [
    'Ratanada',
    'Sardarpura',
    'Shastri Nagar',
    'Pratap Nagar',
  ];

  List<Map<String, dynamic>> months = [
    {"index": 0, "month": "All Months"},
    {"index": 1, "month": "January"},
    {"index": 2, "month": "February"},
    {"index": 3, "month": "March"},
    {"index": 4, "month": "April"},
    {"index": 5, "month": "May"},
    {"index": 6, "month": "June"},
    {"index": 7, "month": "July"},
    {"index": 8, "month": "August"},
    {"index": 9, "month": "September"},
    {"index": 10, "month": "October"},
    {"index": 11, "month": "November"},
    {"index": 12, "month": "December"},
  ];


  void toggleSelection(
    List<String> selectedList,
    String value, {
    bool allowMultiple = false,
  }) {
    if (allowMultiple) {
      if (selectedList.contains(value)) {
        selectedList.remove(value);
      } else {
        selectedList.add(value);
      }
    } else {
      selectedList.clear();
      selectedList.add(value);
    }
    update();
  }

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
    if (!hasMoreData) return;

    try {
      setErrorMessage('');
      if (!loadMore) setBusy(true);

      String eventType =  _appEntryController.eventMetaData?.eventType?.firstWhere((e) => e.name?.toLowerCase().replaceAll(" ", "") == EventTypes.curatedParties.name.toLowerCase()).id ?? '';
      print('EVENT TYPE: $eventType');

      final res = await _exploreRepository.getEvents(
        eventType: eventType,
        page: page,
        searchKey: searchKey,
        limit: _pageLimit,
        minPrice: minPrice,
        maxPrice: maxPrice,
        month: month?["index"],
        themeId: partyTheme?.id
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

  void resetAndFetchCuratedEvents() {
    _currentPage = 1;
    hasMoreData = true;
    _curatedParties.clear();
    fetchCuratedEvents();
  }

  void clearFilter() {
    _currentPage = 1;
    hasMoreData = true;
    partyTheme = null;
    minPrice = null;
    maxPrice = null;
    month = null;
    _curatedParties.clear();
    fetchCuratedEvents();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

}
