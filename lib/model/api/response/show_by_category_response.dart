import 'package:find_seat/model/entity/entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'show_by_category_response.g.dart';

@JsonSerializable()
class ShowByCategoryResponse {
  @JsonKey(name: "category_id")
  int categoryId;

  List<Show> shows;

  ShowByCategoryResponse({
    required this.categoryId,
    required this.shows,
  });

  factory ShowByCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$ShowByCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ShowByCategoryResponseToJson(this);
}
