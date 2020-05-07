import 'package:equatable/equatable.dart';
import 'package:find_seat/model/entity/entity.dart';

abstract class ShowDetailsEvent extends Equatable {
  const ShowDetailsEvent();
}

class OpenScreen extends ShowDetailsEvent {
  @override
  List<Object> get props => [];
}

class ClickBtnBook extends ShowDetailsEvent {
  Show show;

  ClickBtnBook(this.show);

  @override
  List<Object> get props => [show];
}

class OpenedBookTimeSlotScreen extends ShowDetailsEvent {
  @override
  List<Object> get props => [];
}
