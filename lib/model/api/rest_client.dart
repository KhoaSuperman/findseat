import 'package:find_seat/model/repo/response/api_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "http://dev.superman-academy.com/mockapi/findseat/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/home.json")
  Future<HomeResponse> getHomeData();
}
