import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CunterEvent,CounterState>{
  CounterBloc(): super(CounterState(0)) {
    on<OnIncrementEvent>((event, emit) {
      emit(CounterState(state.counter + 1));
    });
    on<OnDecrementEvent>((event, emit) {
      emit(CounterState(state.counter - 1));
    });
    on<OnResetEvent>((event, emit) {
      emit(CounterState(0));
    });
  }

  @override
  Future<void> close() {
    return super.close();
  }
}