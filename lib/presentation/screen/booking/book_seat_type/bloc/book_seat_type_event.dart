import 'package:equatable/equatable.dart';
import 'package:find_seat/model/barrel_model.dart';

abstract class BookSeatTypeEvent extends Equatable {
  const BookSeatTypeEvent();
}

class OpenScreen extends BookSeatTypeEvent {
  @override
  List<Object> get props => [];
}

class ClickHowManySeat extends BookSeatTypeEvent {
  int seatCount;

  ClickHowManySeat({
    this.seatCount,
  });

  @override
  List<Object> get props => [seatCount];
}

class ClickSelectSeatType extends BookSeatTypeEvent {
  SEAT_TYPE selectedSeatType;

  ClickSelectSeatType({
    this.selectedSeatType,
  });

  @override
  List<Object> get props => [selectedSeatType];
}

class ClickSelectSeats extends BookSeatTypeEvent {
  @override
  List<Object> get props => [];
}

class OpenedBookSeatSlotScreen extends BookSeatTypeEvent {
  @override
  List<Object> get props => [];
}
