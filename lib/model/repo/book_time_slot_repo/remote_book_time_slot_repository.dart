import 'package:find_seat/model/api/response/api_response.dart';
import 'package:find_seat/model/api/rest_client.dart';
import 'package:dio/dio.dart';
import 'package:find_seat/model/repo/repo.dart';

class RemoteBookTimeSlotRepository extends BookTimeSlotRepository {
  final dio = Dio();

  @override
  Future<List<BookingTimeSlotByCineResponse>> getAllShowsByType(
      String showId) async {
    final client = RestClient(dio);
    //TODO: pass showId to real API
    return client.getBookingTimeSlotByCine();
  }
}
