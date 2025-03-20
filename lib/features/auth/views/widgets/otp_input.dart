import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:soundmates/constants/color_constants.dart';
import 'package:soundmates/extensions/build_context_extension.dart';
import 'package:soundmates/extensions/style_extensions.dart';
import 'package:soundmates/features/auth/views/viewmodel/auth_viewmodel.dart';
import 'package:soundmates/utils/text_styles.dart';

class OtpInput extends ConsumerWidget {
  const OtpInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewmodel = ref.read(authViewmodelProvider.notifier);
    final defaultPinTheme = PinTheme(
      height: context.maxHeight * 0.08,
      width: context.maxWidth * 0.2,
      decoration: BoxDecorationX.smallRoundedColored(),
      textStyle: AppTextStyles.labelLarge(),
    );
    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecorationX.smallRoundedColored(color: ColorConstants.surfaceColorAlt),
    );
    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: defaultPinTheme,
      length: 6,
      onChanged: (value) => viewmodel.otp = value,
      showCursor: false,
    );
  }
}
