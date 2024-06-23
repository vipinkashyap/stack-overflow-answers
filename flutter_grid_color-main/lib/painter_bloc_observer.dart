import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class PainterBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    log('Bloc $bloc, Event  $event');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log('Bloc $bloc, Transition  $transition');
    super.onTransition(bloc, transition);
  }
}
