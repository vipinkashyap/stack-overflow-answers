part of 'painter_bloc.dart';

@immutable
abstract class PainterEvent {}

class ColorTapped extends PainterEvent {
  final Color color;
  final int currentTileIndex;

  ColorTapped(this.color, this.currentTileIndex);

  @override
  String toString() =>
      'ColorTapped(color: $color, currentTileIndex: $currentTileIndex)';
}

class ResetGrid extends PainterEvent {}
