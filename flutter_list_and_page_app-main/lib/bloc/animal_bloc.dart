import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_list_and_page_app/repositories/zoo_repository.dart';

import '../models/models.dart';

part 'animal_event.dart';
part 'animal_state.dart';

class AnimalBloc extends Bloc<AnimalEvent, AnimalState> {
  final ZooRepository _zooRepository;
  AnimalBloc(this._zooRepository) : super(AnimalInitial()) {
    on<DataFetch>((event, emit) async {
      emit(AnimalLoading());
      var animalData = await _zooRepository.fetchData();
      emit(AnimalLoaded(animals: animalData, index: 0));
    });
  }
}
