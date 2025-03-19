part of '../onboarding_page.dart';

class OnboardingBottomButton extends StatelessWidget {
  const OnboardingBottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Beamer.of(context).beamToNamed('/auth');
      },
      child: const Text(StringConstants.onboardingBottomButton),
    ).contraintWidth(context.maxHeight).withPaddingSmallAll();
  }
}
