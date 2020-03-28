import 'dart:async';

import 'package:find_seat/model/entity/cine.dart';
import 'package:find_seat/presentation/screen/home/bloc/bloc.dart';
import 'package:find_seat/presentation/screen/home/nearby_cine/bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class NearbyCineBloc extends Bloc<NearbyCineEvent, NearbyCineState> {
  final HomeBloc homeBloc;
  StreamSubscription subscription;

  NearbyCineBloc({@required this.homeBloc}) {
    subscription = homeBloc.listen(
      (state) {
        if (state is HomeLoaded) {
          add(DisplayNearbyCine(cines: state.response.nearbyTheatres));
        }
      },
    );
  }

  @override
  NearbyCineState get initialState => NearbyCineNotLoaded();

  @override
  Stream<NearbyCineState> mapEventToState(NearbyCineEvent event) async* {
    if (event is DisplayNearbyCine) {
      yield* _mapDisplayNearbyCineToState(event.cines);
    }
  }

  Stream<NearbyCineState> _mapDisplayNearbyCineToState(
      List<Cine> cines) async* {
    yield NearbyCineLoaded(cines: cines);
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
