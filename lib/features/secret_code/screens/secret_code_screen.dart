import 'package:flutter/material.dart';

import '../widgets/app_picture_and_name.dart';
import '../widgets/confirm_button.dart';
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
            AppPictureAndName(),
            SecretCodeForm(),
            ConfirmButton(),
          ],
        ),
      ),
    );
  }
}
