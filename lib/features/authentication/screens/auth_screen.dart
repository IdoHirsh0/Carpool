import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sign_button/sign_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Providers import
import '../../../core/constants/providers.dart';

class AuthScreen extends HookWidget {
  const AuthScreen({Key key}) : super(key: key);

  static const routeName = '/authentication-screen';

  @override
  Widget build(BuildContext context) {
    final modelRoute = ModalRoute.of(context);
    final Map<String, String> arguments = modelRoute.settings.arguments;
    final secretCode = arguments['secretCode'];

    // Authentication provider
    final authProvider = useProvider(globalAuthProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignInButton(
              buttonType: ButtonType.mail,
              onPressed: () {},
            ),
            SizedBox(height: 10),
            SignInButton(
              buttonType: ButtonType.google,
              onPressed: () {
                authProvider.signInAndCreateAppUser(context, secretCode);
              },
            ),
            SizedBox(height: 10),
            SignInButton(
              buttonType: ButtonType.facebook,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
