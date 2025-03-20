part of '../auth_page.dart';

class AuthBottomButton extends ConsumerWidget {
  const AuthBottomButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        ref.read(authViewmodelProvider.notifier).verifyPhoneNumber();
      },
      child: const Text('test'),
    ).constraintWidth(context.maxWidth);
  }
}
