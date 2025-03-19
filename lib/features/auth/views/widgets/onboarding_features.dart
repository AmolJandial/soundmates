part of '../onboarding_page.dart';

class OnboardingFeatures extends StatelessWidget {
  const OnboardingFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFeature(context, 'text ' * 3, AssetConstants.placeholderIcon),
        _buildFeature(context, 'text ' * 7, AssetConstants.placeholderIcon),
        _buildFeature(context, 'text ' * 4, AssetConstants.placeholderIcon),
      ],
    );
  }

  Widget _buildFeature(BuildContext context, String text, String iconPath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: Dimens.pt8,
      children: [
        Container(decoration: BoxDecorationX.circle, child: VectorGraphicX.makeIcon(iconPath).withPaddingSmallAll()),
        Text(
          text,
          style: AppTextStyles.headlineSmall(),
          textAlign: TextAlign.center,
        ).contraintWidth(context.maxWidth * 0.3),
      ],
    );
  }
}
