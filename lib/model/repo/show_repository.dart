import 'package:find_seat/model/api/response/api_response.dart';
import 'package:find_seat/model/api/rest_client.dart';
import 'package:dio/dio.dart';

class ShowRepository {
  final dio = Dio();

  Future<AllShowsByTypeResponse> getAllShowsByType() async {
    final client = RestClient(dio);
    return client.getAllShowsByType();
  }
}
