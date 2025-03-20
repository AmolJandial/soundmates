import 'package:beamer/beamer.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:soundmates/constants/asset_constants.dart';
import 'package:soundmates/extensions/build_context_extension.dart';
import 'package:soundmates/extensions/string_extenstions.dart';
import 'package:soundmates/extensions/style_extensions.dart';
import 'package:soundmates/extensions/widget_extenstions.dart';
import 'package:soundmates/features/app/views/viewmodel/info_dialog_viewmodel.dart';
import 'package:soundmates/features/app/views/widgets/info_dialog.dart';
import 'package:soundmates/features/auth/views/viewmodel/auth_viewmodel.dart';
import 'package:soundmates/utils/dimens.dart';
import 'package:soundmates/utils/helper_methods.dart';
import 'package:soundmates/utils/logger_config.dart';
import 'package:soundmates/utils/text_styles.dart';

part 'widgets/auth_header.dart';
part 'widgets/auth_input.dart';
part 'widgets/auth_bottom_button.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(authViewmodelProvider);
    ref.listen(infoDialogViewmodelProvider, (_, next) {
      if (next.showDialog && next.message.isNullOrEmpty) {
        HelperMethods.dismissKeyboard(context);
        showDialog<void>(context: context, barrierDismissible: false, builder: (_) => const InfoDialog());
      } else if (!next.showDialog) {
        appLogger.info('SHOULD POP NOW');
        Navigator.of(context).pop();
        Beamer.of(context).beamToNamed('/auth/otp');
      }
    });
    return Scaffold(
      appBar: AppBar(),
      body:
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: Dimens.pt16,
            children: [AuthHeader(), AuthInput(), Spacer(), AuthBottomButton()],
          ).withPaddingSmallAll().expand().withSafeArea(),
    );
  }
}
