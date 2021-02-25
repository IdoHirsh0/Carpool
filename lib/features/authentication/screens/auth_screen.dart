import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_button/sign_button.dart';

import '../providers/auth_provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key key}) : super(key: key);

  static const routeName = '/authentication-screen';

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    final Map<String, String> arguments =
        ModalRoute.of(context).settings.arguments;
    final secretCode = arguments['secretCode'];

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
