import 'package:equatable/equatable.dart';

abstract class ListMyTicketEvent extends Equatable {}

class OpenScreenListMyTicketEvent extends ListMyTicketEvent {
  @override
  List<Object> get props => [];
}
