import 'package:find_seat/model/api/response/api_response.dart';
import 'package:find_seat/model/entity/book_time_slot.dart';
import 'package:find_seat/model/repo/repo.dart';
import 'package:find_seat/presentation/screen/booking/book_time_slot/bloc/bloc.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('BookTimeSlotBloc', () {
    final bookTimeSlotRepository = MockBookTimeSlotRepository();

    final List<BookingTimeSlotByCineResponse> mockRawData =
        MockBookTimeSlotRepository.getMockData();

    final List<BookTimeSlot> mockData =
        BookTimeSlotBloc.toBookTimeSlots(mockRawData);

    setUp(() {
//      bloc = BookTimeSlotBloc(bookTimeSlotRepository: bookTimeSlotRepository);
    });

//    test('initial state', () {
//      expect(bloc.initialState, BookTimeSlotState(isLoading: true));
//    });

    blocTest<BookTimeSlotBloc, BookTimeSlotEvent, BookTimeSlotState>(
      'emits OpenScreen event',
      build: () async =>
          BookTimeSlotBloc(bookTimeSlotRepository: bookTimeSlotRepository),
      act: (BookTimeSlotBloc bloc) async {
        bloc.add(OpenScreen());
      },
      expect: <BookTimeSlotState>[
        BookTimeSlotState(
          list: mockData,
          isLoading: false,
        ),
      ],
    );

    blocTest<BookTimeSlotBloc, BookTimeSlotEvent, BookTimeSlotState>(
      'emits ClickIconSearch event, showSearchField to true ',
      build: () async =>
          BookTimeSlotBloc(bookTimeSlotRepository: bookTimeSlotRepository),
      act: (BookTimeSlotBloc bloc) async {
        bloc.add(ClickIconSearch());
      },
      expect: <BookTimeSlotState>[
        BookTimeSlotState(
          showSearchField: true,
        )
      ],
    );
//
    final expectedFilterList = BookTimeSlotBloc.toBookTimeSlots(mockRawData
        .where(BookTimeSlotBloc.getFakeServerFilter("Karpagam"))
        .toList());
    blocTest<BookTimeSlotBloc, BookTimeSlotEvent, BookTimeSlotState>(
      'emits SearchQueryChanged event, should UpdateToolbarState.showSearchField to false, return filtered list',
      build: () async =>
          BookTimeSlotBloc(bookTimeSlotRepository: bookTimeSlotRepository),
      act: (BookTimeSlotBloc bloc) async {
        bloc.add(SearchQueryChanged(keyword: "Karpagam"));
      },
      expect: <BookTimeSlotState>[
        //only 1 state. because first state is duplicate with initialState
        BookTimeSlotState(
          list: expectedFilterList,
          isLoading: false,
          showSearchField: false,
        )
      ],
    );

    //
  });
}
