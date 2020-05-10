import 'package:find_seat/model/api/dio_provider.dart';
import 'package:find_seat/model/api/rest_client.dart';
import 'package:find_seat/model/entity/entity.dart';

abstract class SeatSlotRepository {
  Future<List<SeatType>> getListSeatSlotBySeatTypes();
}

class MockSeatSlotRepository extends SeatSlotRepository {
  @override
  Future<List<SeatType>> getListSeatSlotBySeatTypes() {
    return Future.value(SeatType.SAMPLE_DATA);
  }
}

class RemoteSeatSlotRepository extends SeatSlotRepository {
  final dio = DioProvider.instance();

  @override
  Future<List<SeatType>> getListSeatSlotBySeatTypes() async {
    final client = RestClient(dio);
    final response = await client.getListSeatSlotBySeatType();
    return response.data;
  }
}
