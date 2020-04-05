import 'package:find_seat/model/api/response/api_response.dart';
import 'package:find_seat/model/entity/entity.dart';
import 'package:find_seat/model/repo/repo.dart';

class MockBookTimeSlotRepository extends BookTimeSlotRepository {
  @override
  Future<List<BookingTimeSlotByCineResponse>> getAllShowsByType(
      String showId) async {
    return Future.value(getMockData());
  }

  static List<BookingTimeSlotByCineResponse> getMockData() {
    final response1 = BookingTimeSlotByCineResponse(
      id: "1",
      cine: Cine.SAMPLE_DATA[0],
      timeSlots: [],
      tami: ['3D', '2D'],
    );

    final response2 = BookingTimeSlotByCineResponse(
      id: "2",
      cine: Cine.SAMPLE_DATA[1],
      timeSlots: [],
      tami: ['3D'],
    );

    final response3 = BookingTimeSlotByCineResponse(
      id: "3",
      cine: Cine.SAMPLE_DATA[2],
      timeSlots: [],
      tami: ['2D'],
    );

    return [response1, response2, response3];
  }
}
