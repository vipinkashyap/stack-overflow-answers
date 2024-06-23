part of 'painter_bloc.dart';

@immutable
abstract class PainterState extends Equatable {
  final List<Tile> tiles;

  const PainterState(this.tiles);

  @override
  List<Object?> get props => [tiles];
}

class PainterInitial extends PainterState {
  PainterInitial() : super(List.generate(30, (index) => Tile.empty(index)));
}

class PainterMarked extends PainterState {
  const PainterMarked(List<Tile> tiles) : super(tiles);
}
