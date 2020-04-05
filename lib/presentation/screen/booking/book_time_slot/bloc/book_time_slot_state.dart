import 'package:equatable/equatable.dart';
import 'package:find_seat/model/entity/entity.dart';

abstract class BookTimeSlotState extends Equatable {
  const BookTimeSlotState();
}

class DisplayListBookTimeSlot extends BookTimeSlotState {
  List<BookTimeSlot> list;
  bool loading;
  String msg;

  DisplayListBookTimeSlot({
    this.list,
    this.loading,
    this.msg,
  });

  factory DisplayListBookTimeSlot.loading() {
    return DisplayListBookTimeSlot(msg: null, list: null, loading: true);
  }

  factory DisplayListBookTimeSlot.data(List<BookTimeSlot> list) {
    return DisplayListBookTimeSlot(msg: null, list: list, loading: false);
  }

  factory DisplayListBookTimeSlot.error(String msg) {
    return DisplayListBookTimeSlot(msg: msg, list: null, loading: false);
  }

  @override
  List<Object> get props => [list, loading, msg];

  @override
  String toString() {
    return 'DisplayListBookTimeSlot{list: $list, loading: $loading, msg: $msg}';
  }
}

class UpdateToolbarState extends BookTimeSlotState {
  final bool showSearchField;

  UpdateToolbarState({this.showSearchField});

  @override
  List<Object> get props => [showSearchField];

  @override
  String toString() {
    return 'UpdateSearchIconState{showSearchIcon: $showSearchField}';
  }
}
