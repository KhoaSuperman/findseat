import 'package:find_seat/model/api/response/api_response.dart';
import 'package:find_seat/model/entity/book_time_slot.dart';
import 'package:find_seat/model/repo/repo.dart';
import 'package:find_seat/presentation/screen/booking/book_time_slot/bloc/bloc.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  //TODO: need check again. test failed
  group('BookTimeSlotBloc', () {
    final bookTimeSlotRepository = MockBookTimeSlotRepository();

    final List<BookingTimeSlotByCineResponse> mockResponse =
        MockBookTimeSlotRepository.getMockData();

    final List<BookTimeSlot> mockListBookTimeSlots =
        BookTimeSlotBloc.toBookTimeSlots(mockResponse);

    test('emits OpenScreen then SearchQueryChange', () async {
      final bloc =
          BookTimeSlotBloc(bookTimeSlotRepository: bookTimeSlotRepository);
      //1. Open screen
      bloc.add(OpenScreen());

      //2. Click open icon search
      bloc.add(ClickIconSearch());

      //3. Try to search
      final keyword = "Karpagam";
      bloc.add(SearchQueryChanged(keyword: keyword));

      //4. Close search
      bloc.add(ClickCloseSearch());

      //5. Open BookSeatType screen
      bloc.add(SelectTimeSlot());

      //6. BookSeatType screen is open
      bloc.add(OpenedBookSeatTypeScreen());

      await emitsExactly(
        bloc,
        [
          BookTimeSlotState(isLoading: false, list: mockListBookTimeSlots),
          BookTimeSlotState(
            isLoading: false,
            list: mockListBookTimeSlots,
            showSearchField: true,
          ),
          //
          BookTimeSlotState(
            isLoading: true,
            list: mockListBookTimeSlots,
            showSearchField: true,
          ),
          BookTimeSlotState(
            isLoading: false,
            list: BookTimeSlotBloc.toBookTimeSlots(
              mockResponse.where(BookTimeSlotBloc.filterFake(keyword)).toList(),
            ),
            showSearchField: true,
          ),
          //
          BookTimeSlotState(
            isLoading: false,
            list: BookTimeSlotBloc.toBookTimeSlots(
              mockResponse.where(BookTimeSlotBloc.filterFake(keyword)).toList(),
            ),
            showSearchField: false,
          ),
          BookTimeSlotState(
            isLoading: true,
            list: BookTimeSlotBloc.toBookTimeSlots(
              mockResponse.where(BookTimeSlotBloc.filterFake(keyword)).toList(),
            ),
            showSearchField: false,
          ),
          BookTimeSlotState(
            isLoading: false,
            list: mockListBookTimeSlots,
            showSearchField: false,
          ),
          //
          BookTimeSlotState(
            isLoading: false,
            list: mockListBookTimeSlots,
            showSearchField: false,
            isOpenBookSeatTypeScreen: true,
          ),
          //
          BookTimeSlotState(
            isLoading: false,
            list: mockListBookTimeSlots,
            showSearchField: false,
            isOpenBookSeatTypeScreen: false,
          ),
        ],
      );

      //
    });

    //
  });
}
