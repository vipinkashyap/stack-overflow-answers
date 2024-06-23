import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/models.dart';
import '../widgets.dart/widgets.dart';
import 'blocs/blocs.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({Key? key}) : super(key: key);
  _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        behavior: SnackBarBehavior.floating,
        elevation: 10,
        backgroundColor: Colors.orange,
        content: Text('Choose another character to compare')));
  }

  _showBottomSheet(List<Character> selectedCharacters, BuildContext contextx) {
    log(contextx.read<CharacterBloc>().state.toString());
    showModalBottomSheet<void>(
      isDismissible: true,
      context: contextx,
      builder: (BuildContext context) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: [
                      Text(contextx
                          .read<CharacterBloc>()
                          .state
                          .selectedCharacters![0]
                          .name),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * .35,
                          height: MediaQuery.of(context).size.height * .35,
                          child: Image.network(contextx
                              .read<CharacterBloc>()
                              .state
                              .selectedCharacters![0]
                              .image)),
                      Text(contextx
                          .read<CharacterBloc>()
                          .state
                          .selectedCharacters![0]
                          .gender),
                      Text(
                          'House: ${contextx.read<CharacterBloc>().state.selectedCharacters![0].house}'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(contextx
                          .read<CharacterBloc>()
                          .state
                          .selectedCharacters![1]
                          .name),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * .35,
                          height: MediaQuery.of(context).size.height * .35,
                          child: Image.network(contextx
                              .read<CharacterBloc>()
                              .state
                              .selectedCharacters![1]
                              .image)),
                      Text(contextx
                          .read<CharacterBloc>()
                          .state
                          .selectedCharacters![1]
                          .gender),
                      Text(
                          'House: ${contextx.read<CharacterBloc>().state.selectedCharacters![1].house}'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(),
            MaterialButton(
              color: Colors.orange,
              child: const Text('Compare Again'),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      },
    ).whenComplete(
        () => contextx.read<CharacterBloc>().add(CharactersDeselected()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CharacterBloc, CharacterState>(
      listener: (context, state) {
        if (state.selectedCharacters?.length == null) {
        } else if (state.selectedCharacters!.length >= 2) {
          _showBottomSheet(state.selectedCharacters!, context);
        } else if (state.selectedCharacters!.length == 1) {
          _showSnackBar(context);
        }
      },
      builder: (context, state) {
        if (state is CharactersLoading) {
          return const Loader();
        }
        if (state is CharactersError) {
          return const CenterError();
        }
        if (state is CharactersLoaded) {
          return Scaffold(
            body: SafeArea(
                minimum: const EdgeInsets.only(
                    top: 30, bottom: 30, left: 20, right: 20),
                child: BlocBuilder<CharacterBloc, CharacterState>(
                  buildWhen: (previous, current) => previous != current,
                  builder: (context, state) {
                    return GridView.builder(
                        itemCount: 20,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => context
                                      .read<CharacterBloc>()
                                      .add(CharacterSelected(
                                          character: context
                                              .read<CharacterBloc>()
                                              .state
                                              .characters![index])),
                                  //Replace with another widget once selected
                                  // Meaning visibility should be false if the card at index is in selected items
                                  child: Visibility(
                                    replacement: const SelectedIcon(),
                                    visible: context
                                                .read<CharacterBloc>()
                                                .state
                                                .selectedCharacters!
                                                .contains(context
                                                    .read<CharacterBloc>()
                                                    .state
                                                    .characters![index]) ==
                                            true
                                        ? false
                                        : true,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(context
                                                  .read<CharacterBloc>()
                                                  .state
                                                  .characters![index]
                                                  .image),
                                              fit: BoxFit.contain)),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  context
                                      .read<CharacterBloc>()
                                      .state
                                      .characters![index]
                                      .name,
                                ),
                              )
                            ],
                          );
                        });
                  },
                )),
          );
        }
        return const CenterError();
      },
    );
  }
}
