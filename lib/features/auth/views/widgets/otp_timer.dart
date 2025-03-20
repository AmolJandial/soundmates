import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jiffy/jiffy.dart';
import 'package:soundmates/constants/color_constants.dart';
import 'package:soundmates/extensions/style_extensions.dart';
import 'package:soundmates/extensions/widget_extenstions.dart';
import 'package:soundmates/utils/dimens.dart';
import 'package:soundmates/utils/logger_config.dart';
import 'package:soundmates/utils/text_styles.dart';

class OtpTimer extends HookConsumerWidget {
  const OtpTimer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enabled = useState(false);
    final countdown = useState(10.seconds);
    final timer = useState<Timer?>(null);
    useEffect(() {
      if (countdown.value > Duration.zero) {
        timer.value = Timer.periodic(1.seconds, (_) {
          if (countdown.value > Duration.zero) {
            countdown.value = countdown.value - 1.seconds;
          } else {
            timer.value?.cancel();
            enabled.value = true;
          }
        });
      }

      return () {
        timer.value?.cancel();
      };
    }, [countdown.value]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: Dimens.pt8,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: Dimens.pt4,
          children: [
            _getTimeContainer(countdown.value.inMinutes.remainder(60).abs().toString().padLeft(2, '0')),
            Text(':', style: AppTextStyles.headlineLarge()),
            _getTimeContainer(countdown.value.inSeconds.remainder(60).abs().toString().padLeft(2, '0')),
          ],
        ),
        TextButton(
          onPressed:
              enabled.value
                  ? () {
                    countdown.value = 2.minutes;
                    enabled.value = false;
                  }
                  : null,
          child: const Text('Resend Code'),
        ),
      ],
    );
  }

  Widget _getTimeContainer(String text) {
    return Container(
      decoration: BoxDecorationX.smallRoundedColored(color: ColorConstants.primaryTextColor),
      padding: PaddingX.medium,
      child: Text(text, style: AppTextStyles.labelLarge(color: ColorConstants.secondaryTextColor)),
    );
  }
}
