import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_list_and_page_app/views/animal_pages.dart';

import '../bloc/animal_bloc.dart';
import '../repositories/zoo_repository.dart';

class AnimalList extends StatelessWidget {
  const AnimalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AnimalBloc(context.read<ZooRepository>())..add(DataFetch()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Animal List'),
        ),
        body: BlocBuilder<AnimalBloc, AnimalState>(
          builder: (context, state) {
            if (state is AnimalLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is AnimalLoaded) {
              return ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: 8,
                  itemBuilder: ((context, index) => Padding(
                        padding: const EdgeInsets.all(20),
                        child: GestureDetector(
                          onTap: () {
                            // Push to new page and provide the bloc
                            Navigator.of(context).push(MaterialPageRoute(
                                settings: RouteSettings(
                                    name: 'index',
                                    arguments: {'initialPage': index}),
                                builder: ((_) => BlocProvider.value(
                                      value:
                                          BlocProvider.of<AnimalBloc>(context),
                                      child: const AnimalPages(),
                                    ))));
                          },
                          child: ListTile(
                            leading:
                                Image.network(state.animals[index].imageLink),
                            title: Text(state.animals[index].name),
                          ),
                        ),
                      )));
            }
            return const Center(child: Text('N/A State'));
          },
        ),
      ),
    );
  }
}
