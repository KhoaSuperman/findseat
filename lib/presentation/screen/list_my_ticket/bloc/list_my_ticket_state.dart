import 'package:find_seat/model/entity/ticket.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'list_my_ticket_state.freezed.dart';

@freezed
abstract class ListMyTicketState with _$ListMyTicketState {
  const factory ListMyTicketState({
    @Default(true) bool isLoading,
    @Default([]) List<Ticket> data,
    String? msg,
  }) = _ListMyTicketState;
}
