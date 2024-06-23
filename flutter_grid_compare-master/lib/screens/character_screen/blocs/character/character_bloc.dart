import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grid_compare/data/repositories/hp_repository.dart';

import '../../../../../models/models.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final HpRepository _hpRepository;
  CharacterBloc({HpRepository? hpRepository})
      : _hpRepository = hpRepository ?? HpRepository(),
        super(CharacterInitial()) {
    on<FetchCharacters>(_onFetchCharacters);
    on<CharacterSelected>(_onCharacterSelected);
    on<CharactersDeselected>(_onCharacterDeselected);
  }

  void _onFetchCharacters(
      FetchCharacters event, Emitter<CharacterState> emit) async {
    try {
      emit(CharactersLoading());
      var characters = await _hpRepository.getCharacters();
      emit(CharactersLoaded(characters, const <Character>[]));
    } catch (_) {
      emit(CharactersError());
    }
  }

  void _onCharacterSelected(
      CharacterSelected event, Emitter<CharacterState> emit) {
    if (state.selectedCharacters == null) {
      var selectedCharacters = <Character>[];

      selectedCharacters.add(event.character);

      emit(CharactersLoaded(state.characters!, selectedCharacters));
    } else {
      var selectedCharacters = [...state.selectedCharacters!];
      if (selectedCharacters.length >= 2) {
        selectedCharacters.removeAt(0);
      }
      selectedCharacters.add(event.character);
      emit(CharactersLoaded(state.characters!, selectedCharacters));
    }
  }

  void _onCharacterDeselected(
      CharactersDeselected event, Emitter<CharacterState> emit) async {
    emit(CharactersLoaded(state.characters!, const <Character>[]));
  }
}
