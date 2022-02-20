import 'package:equatable/equatable.dart';
import 'package:find_seat/presentation/screen/booking/book_seat_slot/viewmodel/viewmodel.dart';
import 'package:meta/meta.dart';

abstract class BookSeatSlotEvent extends Equatable {
  const BookSeatSlotEvent();
}

class OpenScreen extends BookSeatSlotEvent {
  @override
  List<Object> get props => [];
}

class ClickSelectSeatSlot extends BookSeatSlotEvent {
  ItemSeatSlotVM itemSeatSlotVM;

  ClickSelectSeatSlot({
    required this.itemSeatSlotVM,
  });

  @override
  List<Object> get props => [itemSeatSlotVM];
}

class DismissMessageWrongSeatType extends BookSeatSlotEvent {
  @override
  List<Object> get props => [];
}

class DismissMessageReachedLimitSeatSlot extends BookSeatSlotEvent {
  @override
  List<Object> get props => [];
}

class ClickButtonPay extends BookSeatSlotEvent {
  @override
  List<Object> get props => [DateTime.now().millisecond];
}

class OpenedPaymentMethodScreen extends BookSeatSlotEvent {
  @override
  List<Object> get props => [];
}
