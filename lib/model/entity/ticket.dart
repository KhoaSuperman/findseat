import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'ticket.g.dart';

@JsonSerializable()
class Ticket extends Equatable {
  int id;

  @JsonKey(name: "show_name")
  String showName;

  @JsonKey(name: "show_banner")
  String showBanner;

  @JsonKey(name: "show_time_slot")
  String showTimeSlot;

  @JsonKey(name: "book_time")
  int bookTime;

  @JsonKey(name: "cine_name")
  String cineName;

  String seat;

  Ticket(
    this.id,
    this.showName,
    this.showBanner,
    this.showTimeSlot,
    this.bookTime,
    this.cineName,
    this.seat,
  );

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);

  Map<String, dynamic> toJson() => _$TicketToJson(this);

  @override
  List<Object> get props => [id];

  @override
  String toString() {
    return 'Ticket{id: $id, showName: $showName, seat: $seat}';
  }
}
