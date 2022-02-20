import 'dart:developer';

import 'package:bloc/bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log(event?.toString() ?? '');
//    LogUtils.blocLogger.i('onEvent $event');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    log('error', error: error);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log('currentState=${transition.currentState}\n'
        'nextState=${transition.nextState}');
  }
}
