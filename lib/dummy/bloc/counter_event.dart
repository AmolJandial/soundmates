part of 'counter_bloc.dart';

sealed class CounterEvent extends Equatable {
  const CounterEvent({required this.value});

  final int value;

  @override
  List<Object> get props => [value];
}

final class CounterIncrementPressed extends CounterEvent {
  const CounterIncrementPressed({required super.value});
}

final class CounterDecrementPressed extends CounterEvent {
  const CounterDecrementPressed({required super.value});
}

class CounterDeletePressed extends CounterEvent {
  const CounterDeletePressed({required super.value});

  @override
  List<Object> get props => [];
}
