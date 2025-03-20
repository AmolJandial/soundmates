import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:lottie/lottie.dart';
import 'package:soundmates/constants/asset_constants.dart';
import 'package:soundmates/constants/color_constants.dart';
import 'package:soundmates/enums/dialog_status.dart';
import 'package:soundmates/extensions/build_context_extension.dart';
import 'package:soundmates/extensions/style_extensions.dart';
import 'package:soundmates/extensions/widget_extenstions.dart';
import 'package:soundmates/features/app/views/viewmodel/info_dialog_viewmodel.dart';
import 'package:soundmates/utils/dimens.dart';
import 'package:soundmates/utils/text_styles.dart';

class InfoDialog extends ConsumerWidget {
  const InfoDialog({super.key, this.showButton = false});

  final bool showButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      shape: ShapeBorderX.smallRounded,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: Dimens.pt8,
        children: [
          const _ErrorStatusWidget().withPaddingMediumAll(),
          const Divider(color: ColorConstants.surfaceColor, thickness: Dimens.pt2),
          const _ErrorMessageWidget().withPaddingMediumAll(),
          if (showButton)
            ElevatedButton(
              onPressed: () {
                ref.read(infoDialogViewmodelProvider.notifier).copyWith(showDialog: false, message: '');
              },
              child: const Text('Close'),
            ).withPaddingMediumAll().constraintWidth(context.maxWidth),
        ],
      ),
    );
  }
}

class _ErrorStatusWidget extends ConsumerWidget {
  const _ErrorStatusWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(infoDialogViewmodelProvider.select((state) => state.status));

    return switch (status) {
      DialogStatus.error => makeErrorIndicator(),
      DialogStatus.success => makeSuccessIndicator(),
      DialogStatus.loading => makeLoadingIndicator(),
    };
  }

  Widget makeLoadingIndicator() => const LoadingIndicator(
    indicatorType: Indicator.orbit,
    colors: [ColorConstants.primaryTextColor],
  ).constraint(100, 100);

  Widget makeSuccessIndicator() => Lottie.asset(AssetConstants.successAnimnation, repeat: false).constraint(100, 100);
  Widget makeErrorIndicator() => Lottie.asset(AssetConstants.errorAnimnation, repeat: false).constraint(100, 100);
}

class _ErrorMessageWidget extends ConsumerWidget {
  const _ErrorMessageWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final message = ref.watch(infoDialogViewmodelProvider.select((state) => state.message));

    return Text(message, style: AppTextStyles.bodyLarge(weight: FontWeight.w400), textAlign: TextAlign.center);
  }
}
