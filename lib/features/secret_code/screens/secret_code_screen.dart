import 'package:flutter/material.dart';

import '../../../core/widgets/app_logo.dart';
import '../widgets/secret_code_form.dart';

class SecretCodeScreen extends StatelessWidget {
  const SecretCodeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppLogo(),
            SecretCodeForm(),
          ],
        ),
      ),
    );
  }
}
