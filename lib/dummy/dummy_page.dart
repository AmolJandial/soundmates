import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:soundmates/dummy/bloc/counter_bloc.dart';

class DummyPage extends HookWidget {
  const DummyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(lazy: false, create: (BuildContext context) => CounterBloc())],
      child: const MaterialApp(home: DummyScreen()),
    );
  }
}

class DummyScreen extends HookWidget {
  const DummyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('dummy')));
  }
}
