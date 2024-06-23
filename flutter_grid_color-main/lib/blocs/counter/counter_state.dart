part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  final int counterIndex;
  const CounterState({required this.counterIndex});

  @override
  List<Object> get props => [counterIndex];
}

class CounterInitial extends CounterState {
  const CounterInitial() : super(counterIndex: 0);
}

class CounterUpdate extends CounterState {
  const CounterUpdate({required int counterIndex})
      : super(counterIndex: counterIndex);
}
