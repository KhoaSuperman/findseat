
import 'package:find_seat/model/entity/entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'all_show_by_type_response.g.dart';

@JsonSerializable()
class AllShowsByTypeResponse{

  @JsonKey(name: "now_showing")
  List<Show> nowShowing;

  @JsonKey(name: "coming_soon")
  List<Show> comingSoon;

  @JsonKey(name: "exclusive")
  List<Show> exclusive;

  AllShowsByTypeResponse(this.nowShowing, this.comingSoon, this.exclusive);

  factory AllShowsByTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$AllShowsByTypeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AllShowsByTypeResponseToJson(this);

  @override
  String toString() {
    return 'AllShowsByTypeResponse{nowShowing: $nowShowing, comingSoon: $comingSoon, exclusive: $exclusive}';
  }


}