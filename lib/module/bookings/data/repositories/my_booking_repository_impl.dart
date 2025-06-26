
import 'package:partyspot/module/bookings/data/models/my_booking_response.dart';
import 'package:partyspot/module/bookings/domain/repositories/my_booking_repository.dart';
import 'package:partyspot/networking/api_urls.dart';
import 'package:partyspot/utils/services/part_spot_api_service.dart';

class MyBookingRepositoryImpl extends PartySportApiService implements MyBookingRepository {

  @override
  Future<MyBookingResponse?> getBookings() async{
    final response = await getRequest(ApiUrl.myBookings);
    return MyBookingResponse.fromJson(response.data);
  }

}
