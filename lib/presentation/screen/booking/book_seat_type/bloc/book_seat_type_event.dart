import 'package:equatable/equatable.dart';

abstract class BookSeatTypeEvent extends Equatable {
  const BookSeatTypeEvent();
}

class OpenScreen extends BookSeatTypeEvent {
  @override
  List<Object> get props => [];
}
