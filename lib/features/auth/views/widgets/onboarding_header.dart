part of '../onboarding_page.dart';

class OnboardingHeader extends StatelessWidget {
  const OnboardingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        VectorGraphic(
          loader: const AssetBytesLoader(AssetConstants.onboardingBackground),
          width: context.maxWidth,
          height: context.maxHeight * 0.6,
          fit: BoxFit.cover,
        ),
        VectorGraphic(
          loader: const AssetBytesLoader(AssetConstants.onboarding),
          width: context.maxWidth,
          height: context.maxHeight * 0.6,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
