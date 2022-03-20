import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'banner.g.dart';

@JsonSerializable()
class Banner extends Equatable {
  int id;
  @JsonKey(name: 'image')
  String url;

  Banner({required this.id, required this.url});

  factory Banner.fromJson(Map<String, dynamic> json) => _$BannerFromJson(json);

  Map<String, dynamic> toJson() => _$BannerToJson(this);

  @override
  List<Object> get props => [id, url];

  @override
  String toString() {
    return 'Banner{id: $id, url: $url}';
  }
}
