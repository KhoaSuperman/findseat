import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'my_ticket.g.dart';

@JsonSerializable()
class MyTicket extends Equatable {
  int id;

  @JsonKey(name: "show_name")
  String showName;

  @JsonKey(name: "book_time")
  int bookTime;

  @JsonKey(name: "cine_name")
  String cineName;

  String seat;

  MyTicket(
    this.id,
    this.showName,
    this.bookTime,
    this.cineName,
    this.seat,
  );

  factory MyTicket.fromJson(Map<String, dynamic> json) =>
      _$MyTicketFromJson(json);

  Map<String, dynamic> toJson() => _$MyTicketToJson(this);

  @override
  List<Object> get props => [id];

  @override
  String toString() {
    return 'MyTicket{id: $id, showName: $showName, seat: $seat}';
  }
}
