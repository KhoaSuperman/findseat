import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'categoryy.g.dart';

@JsonSerializable()
class Categoryy extends Equatable {
  int id;
  String name;
  String icon;

  Categoryy(this.id, this.name, this.icon);

  factory Categoryy.fromJson(Map<String, dynamic> json) =>
      _$CategoryyFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryyToJson(this);

  @override
  List<Object> get props => [id, name, icon];

  @override
  String toString() {
    return 'Categoryy{id: $id, name: $name, icon: $icon}';
  }
}
