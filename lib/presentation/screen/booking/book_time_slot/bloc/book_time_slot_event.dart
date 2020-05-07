import 'package:equatable/equatable.dart';
import 'package:find_seat/model/entity/entity.dart';
import 'package:find_seat/presentation/screen/booking/book_time_slot/bloc/sort_booking_time_slot.dart';
import 'package:meta/meta.dart';

abstract class BookTimeSlotEvent extends Equatable {
  const BookTimeSlotEvent();
}

class OpenScreen extends BookTimeSlotEvent {
  OpenScreen();

  @override
  List<Object> get props => [];
}

class ClickIconSearch extends BookTimeSlotEvent {
  @override
  List<Object> get props => [];
}

class ClickCloseSearch extends BookTimeSlotEvent {
  @override
  List<Object> get props => [];
}

class SearchQueryChanged extends BookTimeSlotEvent {
  String keyword;

  SearchQueryChanged({this.keyword});

  @override
  List<Object> get props => [keyword];

  @override
  String toString() {
    return 'SearchQueryChanged{keyword: $keyword}';
  }
}

class ClickIconSort extends BookTimeSlotEvent {
  @override
  List<Object> get props => [DateTime.now().millisecond];
}

class SortByChanged extends BookTimeSlotEvent {
  BOOKING_TIME_SLOT_SORT_BY sortBy;

  SortByChanged({this.sortBy});

  @override
  List<Object> get props => [sortBy];

  @override
  String toString() {
    return 'SortByChanged{sortBy: $sortBy}';
  }
}

class SelectTimeSlot extends BookTimeSlotEvent {
  TimeSlot selectedTimeSlot;
  BookTimeSlot bookTimeSlot;

  SelectTimeSlot({
    @required this.selectedTimeSlot,
    @required this.bookTimeSlot,
  });

  @override
  List<Object> get props => [selectedTimeSlot, bookTimeSlot];
}

class OpenedBookSeatTypeScreen extends BookTimeSlotEvent {
  @override
  List<Object> get props => [];
}
