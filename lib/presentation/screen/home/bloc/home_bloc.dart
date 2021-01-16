import 'package:find_seat/model/repo/home_repository.dart';
import 'package:find_seat/presentation/screen/home/bloc/bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc({@required this.homeRepository});

  @override
  HomeState get initialState => HomeLoading();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is LoadHome) {
      yield* _mapLoadHomeToState();
    } else if (event is RefreshHome) {
      yield HomeLoading();
      yield* _mapLoadHomeToState();
    }
  }

  Stream<HomeState> _mapLoadHomeToState() async* {
    try {
      final response = await homeRepository.getHomeData();

      yield HomeLoaded(response);
    } catch (e) {
      yield HomeNotLoaded(e.toString());
    }
  }
}
