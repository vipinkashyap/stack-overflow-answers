import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repositories/repositories.dart';
import 'screens/screens.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => HpRepository(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CharacterView(),
      ),
    );
  }
}
