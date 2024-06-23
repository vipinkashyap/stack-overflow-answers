import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_list_and_page_app/animal_bloc_observer.dart';
import 'package:flutter_list_and_page_app/data/data_api.dart';
import 'package:flutter_list_and_page_app/views/animal_list.dart';
import 'package:http/http.dart' as http;

import 'repositories/repositories.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(const MyApp()),
      blocObserver: AnimalBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ZooRepository(DataApi(http.Client())),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Animal Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AnimalList(),
      ),
    );
  }
}
