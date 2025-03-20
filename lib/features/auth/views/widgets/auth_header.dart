part of '../auth_page.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Dimens.pt16,
      children: [
        Row(
          spacing: Dimens.pt8,
          children: [
            VectorGraphicX.makeIcon(AssetConstants.placeholderIcon),
            Text('test ' * 2, style: AppTextStyles.headlineLarge(weight: FontWeight.w700)),
          ],
        ),
        Text('test ' * 5, style: AppTextStyles.headlineSmall(weight: FontWeight.w500)),
        Text('test ' * 10, style: AppTextStyles.bodyMedium(weight: FontWeight.w400)),
      ],
    );
  }
}
