import 'package:partyspot/module/bookings/data/models/my_booking_response.dart';

abstract class MyBookingRepository {
  Future<MyBookingResponse?> getBookings();
}
