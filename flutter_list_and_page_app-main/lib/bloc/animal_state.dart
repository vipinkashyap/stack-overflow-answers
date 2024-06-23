part of 'animal_bloc.dart';

abstract class AnimalState extends Equatable {
  const AnimalState();

  @override
  List<Object> get props => [];
}

class AnimalInitial extends AnimalState {}

class AnimalLoading extends AnimalState {}

class AnimalLoaded extends AnimalState {
  final List<Animal> animals;
  final int index;

  const AnimalLoaded({required this.animals, required this.index});

  AnimalLoaded copyWith({
    List<Animal>? animals,
    int? index,
  }) {
    return AnimalLoaded(
      animals: animals ?? this.animals,
      index: index ?? this.index,
    );
  }
}
