import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:find_seat/model/repo/repo.dart';

import 'bloc.dart';

class ListMyTicketBloc extends Bloc<ListMyTicketEvent, ListMyTicketState> {
  TicketRepo ticketRepo;

  ListMyTicketBloc(this.ticketRepo);

  @override
  ListMyTicketState get initialState => ListMyTicketState();

  @override
  Stream<ListMyTicketState> mapEventToState(
    ListMyTicketEvent event,
  ) async* {
    if (event is OpenScreenListMyTicketEvent) {
      try {
        yield state.copyWith(isLoading: true);

        final data = await ticketRepo.getAll();
        yield state.copyWith(
          isLoading: false,
          data: data,
          msg: data.isEmpty ? "You have no ticket" : null,
        );
      } catch (e) {
        yield state.copyWith(
          isLoading: false,
          msg: e.toString(),
        );
      }
    }
  }
}
