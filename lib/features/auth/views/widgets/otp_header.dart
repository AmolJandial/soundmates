import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:soundmates/features/auth/views/viewmodel/auth_viewmodel.dart';
import 'package:soundmates/utils/dimens.dart';
import 'package:soundmates/utils/text_styles.dart';

class OtpHeader extends ConsumerWidget {
  const OtpHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(authViewmodelProvider);
    return Column(
      spacing: Dimens.pt8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('A 6-digit code has been sent to', style: AppTextStyles.headlineLarge(weight: FontWeight.w400)),
        Text('${state.countryCode}${state.phoneNumber}', style: AppTextStyles.headlineMedium(weight: FontWeight.w500)),
      ],
    );
  }
}
