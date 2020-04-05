import 'package:find_seat/model/repo/repo.dart';
import 'package:find_seat/presentation/screen/booking/book_time_slot/bloc/bloc.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('BookTimeSlotBloc', () {
    BookTimeSlotBloc bloc;
    final bookTimeSlotRepository = MockBookTimeSlotRepository();
    final mockData = BookTimeSlotBloc.toBookTimeSlots(
        MockBookTimeSlotRepository.getMockData());

    setUp(() {
      bloc = BookTimeSlotBloc(bookTimeSlotRepository: bookTimeSlotRepository);
    });

    test('initial state', () {
      expect(bloc.initialState, DisplayListBookTimeSlot.loading());
    });

    blocTest<BookTimeSlotBloc, BookTimeSlotEvent, BookTimeSlotState>(
      'emits OpenScreen event',
      build: () => bloc,
      act: (BookTimeSlotBloc bloc) async {
        bloc.add(OpenScreen());
      },
      expect: <BookTimeSlotState>[
        DisplayListBookTimeSlot.loading(),
        UpdateToolbarState(showSearchField: false),
        DisplayListBookTimeSlot.loading(),
        DisplayListBookTimeSlot.data(mockData),
      ],
    );

    blocTest<BookTimeSlotBloc, BookTimeSlotEvent, BookTimeSlotState>(
      'emits ClickIconSearch event, should UpdateToolbarState.showSearchField to true ',
      build: () => bloc,
      act: (BookTimeSlotBloc bloc) async {
        bloc.add(ClickIconSearch());
      },
      expect: <BookTimeSlotState>[
        DisplayListBookTimeSlot.loading(),
        UpdateToolbarState(showSearchField: true),
      ],
    );
  });
}
