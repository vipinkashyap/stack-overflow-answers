import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/blocs.dart';
import 'views/views.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PainterBloc()),
        BlocProvider(create: ((context) => CounterBloc())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: const GridColorView(
          cardColors: <Color>[
            Colors.yellow,
            Colors.greenAccent,
            Colors.purple,
            Colors.tealAccent,
            Colors.deepOrange
          ],
        ),
      ),
    );
  }
}
