import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../bloc/animal_bloc.dart';

class AnimalPages extends HookWidget {
  const AnimalPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments! as Map<String, dynamic>;
    final pgController = PageController(initialPage: arguments['initialPage']);

    return BlocBuilder<AnimalBloc, AnimalState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Animal Pages')),
          body: BlocBuilder<AnimalBloc, AnimalState>(
            builder: (context, state) {
              if (state is AnimalLoaded) {
                return Stack(
                  children: [
                    PageView.builder(
                        controller: pgController,
                        itemCount: state.animals.length,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Column(
                              children: [
                                Image.network(state.animals[index].imageLink),
                                const SizedBox(height: 20),
                                Text(state.animals[index].name),
                              ],
                            ),
                          );
                        }),
                    Positioned(
                        left: 100,
                        bottom: 100,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  pgController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 100),
                                      curve: Curves.ease);
                                },
                                icon: const Icon(Icons.arrow_back)),
                            const SizedBox(
                              width: 40,
                            ),
                            IconButton(
                                onPressed: () {
                                  pgController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      curve: Curves.ease);
                                },
                                icon: const Icon(Icons.arrow_forward))
                          ],
                        ))
                  ],
                );
              }
              return const Center(child: Text('N/A State'));
            },
          ),
        );
      },
    );
  }
}
