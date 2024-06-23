part of 'character_bloc.dart';

abstract class CharacterEvent extends Equatable {
  const CharacterEvent();

  @override
  List<Object> get props => [];
}

class FetchCharacters extends CharacterEvent {}

class CharacterSelected extends CharacterEvent {
  final Character character;
  const CharacterSelected({required this.character});
}

class CharactersDeselected extends CharacterEvent {}
