import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:soundmates/constants/asset_constants.dart';
import 'package:soundmates/constants/string_constants.dart';
import 'package:soundmates/extensions/build_context_extension.dart';
import 'package:soundmates/extensions/style_extensions.dart';
import 'package:soundmates/extensions/widget_extenstions.dart';
import 'package:soundmates/router/router.dart';
import 'package:soundmates/utils/dimens.dart';
import 'package:soundmates/utils/text_styles.dart';
import 'package:vector_graphics/vector_graphics.dart';
part 'widgets/onboarding_bottom_button.dart';
part 'widgets/onboarding_features.dart';
part 'widgets/onboarding_header.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [OnboardingHeader(), OnboardingFeatures(), Spacer(), OnboardingBottomButton()],
          ).expand().withSafeArea(),
    );
  }
}
