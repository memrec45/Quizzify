import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/enums/app_paddings.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/empty_padding_extension.dart';
import '../../../../core/utils/shared/widgets/buttons/responsive_elevated_button.dart';
import '../bloc/onboarding_bloc.dart';
import '../mixins/form_card_mixin.dart';
import 'name_field.dart';

class FormCard extends StatelessWidget with FormCardMixin {
  final String title;
  final int index;
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  final OnboardingBloc bloc;
  FormCard({
    super.key,
    required this.title,
    required this.index,
    required this.formKey,
    required this.controller,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: AppPaddings().pageHPadding +
            const EdgeInsets.only(bottom: 8, top: 8),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    title,
                    textStyle: context.textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
                isRepeatingAnimation: false,
                key: UniqueKey(),
                // totalRepeatCount: 1,
              ),
              // Text
              // Text(
              //   title,
              //   style: context.textTheme.titleLarge,
              //   textAlign: TextAlign.center,
              // ),
              _PageIndicator(index: index),
              16.ph,
              //   Name field
              NameField(
                context,
                label: "User name",
                controller: controller,
                validator: (value) => validator(value ?? ""),
              ),
              16.ph,
              //  Continue Button
              Row(
                children: [
                  ResponsiveElevatedButton(
                    label: "Continue",
                    onPressed: () => onPressed(
                      formKey,
                      controller.text,
                      bloc,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  const _PageIndicator({
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        indicatorItem("0"),
        indicatorItem("1"),
        indicatorItem("2"),
      ],
    );
  }

  SizedBox indicatorItem(String val) {
    return SizedBox(
      width: 20,
      child: Radio(
        value: val,
        groupValue: index.toString(),
        onChanged: (_) {},
      ),
    );
  }
}
