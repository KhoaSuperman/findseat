import 'package:equatable/equatable.dart';
import 'package:find_seat/model/entity/entity.dart';

abstract class PaymentMethodPickerEvent extends Equatable {}

class OpenScreenPaymentMethodPickerEvent extends PaymentMethodPickerEvent {
  @override
  List<Object> get props => [];
}

class OnPaymentSuccessEvent extends PaymentMethodPickerEvent {
  String showName;
  List<String> seatIds;
  TimeSlot timeSlot;
  String cineName;

  OnPaymentSuccessEvent(
      this.showName, this.seatIds, this.timeSlot, this.cineName);

  @override
  List<Object> get props => [showName, seatIds, timeSlot, cineName];
}
