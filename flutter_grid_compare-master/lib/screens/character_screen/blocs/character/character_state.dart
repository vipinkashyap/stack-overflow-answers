part of 'character_bloc.dart';

abstract class CharacterState extends Equatable {
  final List<Character>? characters;
  final List<Character>? selectedCharacters;
  const CharacterState({this.characters, this.selectedCharacters});

  @override
  List<Object?> get props => [characters, selectedCharacters];
}

class CharacterInitial extends CharacterState {}

class CharactersLoading extends CharacterState {}

class CharactersLoaded extends CharacterState {
  const CharactersLoaded(
      List<Character> characters, List<Character> selectedCharacters)
      : super(characters: characters, selectedCharacters: selectedCharacters);
}

class CharactersError extends CharacterState {}
