part of '../auth_page.dart';

class AuthInput extends HookConsumerWidget {
  const AuthInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneTextEditingController = useTextEditingController();
    final viewmodel = ref.read(authViewmodelProvider.notifier);
    return Row(
      spacing: Dimens.pt8,
      children: [
        Expanded(
          flex: 1,
          child: CountryCodePicker(
            initialSelection: '+91',
            searchStyle: AppTextStyles.bodyMedium(),
            boxDecoration: BoxDecorationX.verySmallRounded,
            onChanged: (value) => viewmodel.countryCode = value.dialCode!,
            builder: (country) {
              return Container(
                decoration: BoxDecorationX.smallRoundedColored(),
                child: Center(child: Text(country!.dialCode!, style: AppTextStyles.bodyLarge()).withPaddingMediumAll()),
              );
            },
          ),
        ),
        Expanded(
          flex: 4,
          child: TextField(
            controller: phoneTextEditingController,
            onChanged: (value) => viewmodel.phoneNumber = value,
            onSubmitted: (_) => viewmodel.verifyPhoneNumber(),
            decoration: const InputDecoration(hintText: '917920182...'),
            style: AppTextStyles.bodyLarge(),
          ),
        ),
      ],
    );
  }
}
