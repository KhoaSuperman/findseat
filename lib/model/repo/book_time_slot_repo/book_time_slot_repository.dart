import 'package:find_seat/model/api/response/api_response.dart';

abstract class BookTimeSlotRepository {
  Future<List<BookingTimeSlotByCineResponse>> getAllShowsByType(String showId);
}
