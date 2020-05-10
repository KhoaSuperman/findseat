import 'package:equatable/equatable.dart';

abstract class BookSeatSlotEvent extends Equatable {
  const BookSeatSlotEvent();
}

class OpenScreen extends BookSeatSlotEvent {
  @override
  List<Object> get props => [];
}
