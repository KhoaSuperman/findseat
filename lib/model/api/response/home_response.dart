import 'package:find_seat/model/api/response/api_response.dart';
import 'package:find_seat/model/entity/categoryy.dart';
import 'package:find_seat/model/entity/entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_response.g.dart';

@JsonSerializable()
class HomeResponse {
  List<Banner> banners;

  List<Categoryy> categories;

  @JsonKey(name: "recommended_seats")
  List<Show> recommendedSeats = [];

  @JsonKey(name: "nearby_theatres")
  List<Cine> nearbyTheatres = [];

  @JsonKey(name: "show_by_categories")
  List<ShowByCategoryResponse> showByCategories = [];

  HomeResponse({
    required this.banners,
    required this.categories,
  });

  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
}
