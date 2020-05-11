import 'package:bloc_test/bloc_test.dart';
import 'package:find_seat/model/barrel_model.dart';
import 'package:find_seat/model/local/pref.dart';
import 'package:find_seat/model/repo/repo.dart';
import 'package:find_seat/presentation/screen/booking/book_seat_slot/bloc/bloc.dart';
import 'package:find_seat/presentation/screen/booking/book_seat_slot/viewmodel/item_seat_slot_vm.dart';
import 'package:test/test.dart';

void main() {
  group('BookSeatSlotBloc', () {
    final sessionRepository = SessionRepository(pref: MemoryPref());
    final seatSlotRepository = MockSeatSlotRepository();

    test('emits OpenScreen', () async {
      final bloc = BookSeatSlotBloc(
          sessionRepository: sessionRepository,
          seatSlotRepository: seatSlotRepository);

      final mockItemGridSeatSlotVMs =
          bloc.toItemGridSeatSlotVMs(SeatType.SAMPLE_DATA);

      final mockItemAfterSelected =
          bloc.toItemGridSeatSlotVMs(SeatType.SAMPLE_DATA);
      //mark G2 is selected
      mockItemAfterSelected[1].seatRowVMs[1].seatSlotVMs[2].isSelected = true;

      //1. OpenScreen
      bloc.add(OpenScreen());

      //2. select seat slot id G2
      bloc.add(ClickSelectSeatSlot(
        itemSeatSlotVM: ItemSeatSlotVM(
          seatId: "G2",
          isSelected: false,
          isOff: false,
          isBooked: false,
        ),
      ));

      await emitsExactly(
        bloc,
        [
          BookSeatSlotState(
            isLoading: false,
            itemGridSeatSlotVMs: mockItemGridSeatSlotVMs,
          ),
          BookSeatSlotState(
            isLoading: false,
            itemGridSeatSlotVMs: mockItemAfterSelected,
          ),
        ],
      );
      //
    });
    //
  });
}
