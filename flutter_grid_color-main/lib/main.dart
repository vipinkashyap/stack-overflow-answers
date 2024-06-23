import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grid_color/painter_bloc_observer.dart';

import 'app.dart';

void main() {
  BlocOverrides.runZoned(
    (() => runApp(const App())),
    blocObserver: PainterBlocObserver(),
  );
}
