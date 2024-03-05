import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/empty_padding_extension.dart';
import '../../../../core/shared/widgets/buttons/responsive_elevated_button.dart';
import '../bloc/auth_bloc.dart';
import '../mixins/alternative_auth_methods_mixin.dart';

class AlternativeAuthMethods extends StatelessWidget
    with AlternativeAuthMethodsMixin {
  final AuthBloc authBloc;

  /// This widget contains Sign up with google and facebook button and a divider.
  AlternativeAuthMethods({
    super.key,
    required this.authBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //! Google Sign up button
        Row(
          children: [
            ResponsiveGoogleSignInButton(
              label: googleButtonLabel,
              onPressed: () => signInWithGoogle(authBloc),
            ),
          ],
        ),
        // 16.ph,
        // Row(
        //   children: [
        //     ResponsiveFacebookButton(
        //       label: _facebookButtonLabel,
        //       onPressed: signInWithFacebook,
        //     ),
        //   ],
        // ),
        32.ph,
        //! Divider
        Row(
          children: <Widget>[
            const Expanded(
              child: Divider(
                endIndent: 8,
              ),
            ),
            Text(
              or,
              style: context.textTheme.labelSmall,
            ),
            const Expanded(
              child: Divider(
                indent: 8,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
