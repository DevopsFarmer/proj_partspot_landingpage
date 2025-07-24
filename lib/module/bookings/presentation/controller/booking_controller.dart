import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/module/bookings/data/models/my_booking_response.dart';
import 'package:partyspot/module/bookings/domain/repositories/my_booking_repository.dart';
import 'package:partyspot/networking/model/error_response_model.dart';
import 'package:partyspot/utils/classes/base_controller.dart';
import 'package:partyspot/utils/constants/service_const.dart';
import 'package:partyspot/utils/constants/string_consts.dart';

class BookingController extends BaseController {

  final ScrollController scrollController = ScrollController();


  final MyBookingRepository _bookingRepository = locator<MyBookingRepository>();

  int _currentPage = 1;
  final int _pageLimit = 20;

  final RxBool _hasMoreData = true.obs;
  bool get hasMoreData => _hasMoreData.value;
  set hasMoreData(bool value) => _hasMoreData.value = value;


  final RxList<Datum?> _bookingList = <Datum?>[].obs;
  List<Datum?> get bookingList => _bookingList.toList();
  set bookingList(List<Datum?> value) => _bookingList.assignAll(value);


  @override
  void onInit() {
    super.onInit();
    fetchBookings();
    scrollController.addListener(scrollListener);
  }

  void scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent && hasMoreData) {
      loadMore();
    }
  }

  Future<void> fetchBookings({int page = 1, bool loadMore = false}) async {
    if (!hasMoreData) return;

    try {
      setErrorMessage('');
      if (!loadMore) setBusy(true);

      final res = await _bookingRepository.getBookings(
        page: page,
        limit: _pageLimit,
      );

      if (res != null && res.data != null) {
        final results = res.data?.data ?? [];
        if (results.length < _pageLimit) {
          hasMoreData = false;
        } else {
          _currentPage++;
        }
        _bookingList.addAll(results);

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
      fetchBookings(page: _currentPage, loadMore: true);
    }
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }
}
