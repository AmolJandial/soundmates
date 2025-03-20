import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:soundmates/extensions/build_context_extension.dart';
import 'package:soundmates/extensions/widget_extenstions.dart';
import 'package:soundmates/features/auth/views/viewmodel/auth_viewmodel.dart';

class OtpBottomButton extends ConsumerWidget {
  const OtpBottomButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        ref.read(authViewmodelProvider.notifier).verifyOtp();
      },
      child: const Text('Test'),
    ).constraintWidth(context.maxWidth);
  }
}
