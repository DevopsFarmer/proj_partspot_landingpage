import 'package:get/get.dart';
import 'package:partyspot/module/bookings/presentation/controller/booking_controller.dart';

class BookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookingController>(() => BookingController());
  }
}
