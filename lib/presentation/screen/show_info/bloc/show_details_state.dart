import 'package:equatable/equatable.dart';

abstract class ShowDetailsState extends Equatable {
  const ShowDetailsState();
}

class InitialShowDetailsState extends ShowDetailsState {
  @override
  List<Object> get props => [];
}

class OpenBookTimeSlotScreen extends ShowDetailsState {
  bool open = false;

  OpenBookTimeSlotScreen({
    this.open,
  });

  @override
  List<Object> get props => [];
}
