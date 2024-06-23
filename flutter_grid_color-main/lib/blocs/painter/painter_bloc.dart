import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../models/models.dart';

part 'painter_event.dart';
part 'painter_state.dart';

class PainterBloc extends Bloc<PainterEvent, PainterState> {
  PainterBloc() : super(PainterInitial()) {
    on<ColorTapped>(_onColorTapped);
    on<ResetGrid>(_onResetGrid);
  }

  void _onColorTapped(ColorTapped event, emit) {
    List<Tile> markedTiles = <Tile>[...state.tiles];

    markedTiles[event.currentTileIndex] = state.tiles
        .where((element) => element.index == event.currentTileIndex)
        .first
        .copyWith(color: event.color);
    emit(PainterMarked(markedTiles));
  }

  void _onResetGrid(ResetGrid event, emit) {
    emit(PainterInitial());
  }
}
