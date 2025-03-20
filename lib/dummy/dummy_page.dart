import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DummyScreen extends HookWidget {
  const DummyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Animate().toggle(
          delay: 2.seconds,
          builder: (_, value, __) {
            return value
                ? const CircularProgressIndicator().animate().fadeOut(duration: 2.seconds)
                : const Text('Hello World', style: TextStyle(fontSize: 32)).animate().fadeIn(duration: 300.ms).scale();
          },
        ),
      ),
    );
  }
}
