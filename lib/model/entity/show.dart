import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'show.g.dart';

@JsonSerializable()
class Show extends Equatable {
  String id;
  String name;
  String thumb;
  String banner;
  int rate;

  Show(this.id, this.name, this.thumb, this.banner, this.rate);

  factory Show.fromJson(Map<String, dynamic> json) => _$ShowFromJson(json);

  Map<String, dynamic> toJson() => _$ShowToJson(this);

  @override
  List<Object> get props => [id, name, thumb, banner, rate];

  @override
  String toString() {
    return 'Show{id: $id, name: $name, thumb: $thumb, banner: $banner, rate: $rate}';
  }

}
