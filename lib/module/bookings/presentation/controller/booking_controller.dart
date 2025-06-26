import 'package:get/get.dart';
import 'package:partyspot/module/bookings/data/models/my_booking_response.dart';
import 'package:partyspot/module/bookings/domain/repositories/my_booking_repository.dart';
import 'package:partyspot/networking/model/error_response_model.dart';
import 'package:partyspot/utils/classes/base_controller.dart';
import 'package:partyspot/utils/constants/service_const.dart';
import 'package:partyspot/utils/constants/string_consts.dart';

class BookingController extends BaseController {

  final MyBookingRepository _bookingRepository = locator<MyBookingRepository>();

  final RxList<Datum?> _bookingList = <Datum?>[].obs;
  List<Datum?> get bookingList => _bookingList.toList();
  set bookingList(List<Datum?> value) => _bookingList.assignAll(value);


  @override
  void onInit() {
    super.onInit();
    fetchBookings();
  }

  Future<void> fetchBookings() async {
    try {
      setBusy(true);
      final res = await _bookingRepository.getBookings();
      bookingList = res?.data ?? [];
    } on ErrorResponse catch (e) {
      setErrorMessage(e.message);
    } catch (e) {
      setErrorMessage(StringConsts.unExpectedError);
    } finally{
      setBusy(false);
    }
  }
}
