import 'package:find_seat/presentation/screen/demo_bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('DemoBlocBloc', () {
    test('emits OpenScreen then SearchQueryChange', () async {
      final bloc = DemoBlocBloc();
      bloc.add(OpenScreen());
      bloc.add(SearchQueryChanged(keyword: "fake"));

      await emitsExactly(bloc, [
        DemoBlocState(
          isLoading: false,
          list: DemoBlocBloc.SAMPLE_DATA,
        ),
        DemoBlocState(
          isLoading: true,
          list: DemoBlocBloc.SAMPLE_DATA,
        ),
        DemoBlocState(
          isLoading: false,
          list: DemoBlocBloc.SAMPLE_FILTERED,
        ),
      ]);
    });
    //
  });
}
