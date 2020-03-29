import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cast.g.dart';

@JsonSerializable()
class Cast extends Equatable {
  String name;
  String photo;

  Cast(this.name, this.photo);

  @override
  List<Object> get props => [name, photo];

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);

  Map<String, dynamic> toJson() => _$CastToJson(this);

  @override
  String toString() {
    return 'Cast{name: $name, photo: $photo}';
  }
}
