import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState.intial()) {
    on<CounterIncrementPressed>(_handleCounterIncrementPressed);
    on<CounterDecrementPressed>(_handleCounterDecrementPressed);
  }

  void _handleCounterIncrementPressed(CounterEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void _handleCounterDecrementPressed(CounterEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter - 1));
  }
}
