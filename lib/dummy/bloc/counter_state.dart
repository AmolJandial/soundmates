part of 'counter_bloc.dart';

class CounterState extends Equatable {
  const CounterState({required this.counter});
  const CounterState.intial({this.counter = 0});

  final int counter;

  @override
  List<Object> get props => [counter];

  CounterState copyWith({int? counter}) {
    return CounterState(counter: counter ?? this.counter);
  }
}
