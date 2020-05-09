import 'package:equatable/equatable.dart';
import 'package:find_seat/model/barrel_model.dart';

abstract class BookSeatTypeEvent extends Equatable {
  const BookSeatTypeEvent();
}

class OpenScreen extends BookSeatTypeEvent {
  @override
  List<Object> get props => [];
}

class ClickSelectSeat extends BookSeatTypeEvent {
  int seatCount;
  SeatType seatType;

  ClickSelectSeat({
    this.seatCount,
    this.seatType,
  });

  @override
  List<Object> get props => [seatCount, seatType];
}
