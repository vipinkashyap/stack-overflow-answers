import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grid_compare/hp_bloc_observer.dart';

import 'app.dart';

void main() {
  BlocOverrides.runZoned((() => runApp(const App())),
      blocObserver: HpBlocObserver());
}
