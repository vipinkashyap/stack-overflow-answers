import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';

class GridColorView extends StatefulWidget {
  final List<Color>? cardColors;
  const GridColorView({Key? key, this.cardColors}) : super(key: key);

  @override
  State<GridColorView> createState() => _GridColorViewState();
}

class _GridColorViewState extends State<GridColorView> {
  void _onResetPressed(BuildContext context) {
    context.read<PainterBloc>().add(ResetGrid());
    context.read<CounterBloc>().add(ResetCounter());
  }

  void _onColorTapped(BuildContext context, int index) {
    context.read<PainterBloc>().add(ColorTapped(widget.cardColors![index],
        context.read<CounterBloc>().state.counterIndex));

    context.read<CounterBloc>().add(IncrementCounter());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _customGridView(context),
            _cardListView(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.orangeAccent.shade400,
        onPressed: () => _onResetPressed(context),
        label: const Text('Reset'),
      ),
    );
  }

  SizedBox _cardListView() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .90,
      height: MediaQuery.of(context).size.height * .08,
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) => MaterialButton(
                  minWidth: 40,
                  onPressed: () => _onColorTapped(context, index),
                  color: widget.cardColors![index],
                )),
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: widget.cardColors!.length),
      ),
    );
  }

  BlocBuilder _customGridView(BuildContext context) {
    return BlocBuilder<PainterBloc, PainterState>(
      builder: (context, state) {
        return GridView(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6, mainAxisSpacing: 10, crossAxisSpacing: 10),
          children: context
              .watch<PainterBloc>()
              .state
              .tiles
              .map((e) => Container(
                    child: Center(child: Text('${e.index + 1}')),
                    color: e.color,
                  ))
              .toList(),
        );
      },
    );
  }
}
