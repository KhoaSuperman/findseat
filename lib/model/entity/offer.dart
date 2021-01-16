import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'offer.g.dart';

@JsonSerializable()
class Offer extends Equatable {
  int id;
  OFFER_TYPE type;
  String title;
  String content;

  Offer(this.id, this.type, this.title, this.content);

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);

  Map<String, dynamic> toJson() => _$OfferToJson(this);

  @override
  List<Object> get props => [id, type, title, content];

  @override
  String toString() {
    return 'Offer{id: $id, type: $type, title: $title, content: $content}';
  }
}

enum OFFER_TYPE {
  @JsonValue("red")
  RED,
  @JsonValue("green")
  GREEN
}
