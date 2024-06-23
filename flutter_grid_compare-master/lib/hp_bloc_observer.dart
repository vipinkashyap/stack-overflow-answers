import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class HpBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    log('''Bloc: $bloc\nTransition: $transition\n
''');
    super.onTransition(bloc, transition);
  }
}
