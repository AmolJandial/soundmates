import 'package:flutter/material.dart';
import 'package:soundmates/extensions/widget_extenstions.dart';
import 'package:soundmates/features/auth/views/widgets/otp_bottom_button.dart';
import 'package:soundmates/features/auth/views/widgets/otp_header.dart';
import 'package:soundmates/features/auth/views/widgets/otp_input.dart';
import 'package:soundmates/features/auth/views/widgets/otp_timer.dart';
import 'package:soundmates/utils/dimens.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: Dimens.pt16,
            children: [OtpHeader(), OtpInput(), SizedBox(height: 16), OtpTimer(), Spacer(), OtpBottomButton()],
          ).withPaddingSmallAll().expand(),
    );
  }
}
