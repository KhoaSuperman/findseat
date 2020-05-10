import 'package:bloc_test/bloc_test.dart';
import 'package:find_seat/model/barrel_model.dart';
import 'package:find_seat/model/local/pref.dart';
import 'package:find_seat/model/repo/repo.dart';
import 'package:find_seat/presentation/screen/booking/book_seat_slot/bloc/bloc.dart';
import 'package:test/test.dart';

void main() {
  group('BookSeatSlotBloc', () {
    final sessionRepository = SessionRepository(pref: MemoryPref());
    final seatSlotRepository = MockSeatSlotRepository();

    test('emits OpenScreen', () async {
      final bloc = BookSeatSlotBloc(
          sessionRepository: sessionRepository,
          seatSlotRepository: seatSlotRepository);

      final mockSeatSlotByTypes = SeatType.SAMPLE_DATA;

      //1. OpenScreen
      bloc.add(OpenScreen());

      await emitsExactly(
        bloc,
        [
          BookSeatSlotState(
            isLoading: false,
            seatSlotByTypes: mockSeatSlotByTypes,
          ),
        ],
      );
      //
    });
    //
  });
}
