import 'package:find_seat/model/api/response/api_response.dart';
import 'package:find_seat/model/entity/entity.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "http://superman-academy.com/api/findseat/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/home.json")
  Future<HomeResponse> getHomeData();

  @GET("/all_shows_by_type.json")
  Future<AllShowsByTypeResponse> getAllShowsByType();

  @GET("/booking_time_slot_by_cine.json")
  Future<List<BookingTimeSlotByCineResponse>> getBookingTimeSlotByCine();

  @GET("/book_seat_slot_by_time_slot.json")
  Future<ListSeatSlotBySeatTypeResponse> getListSeatSlotBySeatType();
}
