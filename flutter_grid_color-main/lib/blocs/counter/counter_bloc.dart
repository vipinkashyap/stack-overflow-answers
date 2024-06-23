import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()) {
    void _onIncrementCounter(IncrementCounter event, emit) {
      emit(CounterUpdate(counterIndex: state.counterIndex + 1));
    }

    void _onResetCounter(ResetCounter event, emit) {
      emit(const CounterInitial());
    }

    on<IncrementCounter>(_onIncrementCounter);
    on<ResetCounter>(_onResetCounter);
  }
}
