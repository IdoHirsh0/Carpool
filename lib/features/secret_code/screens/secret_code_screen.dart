import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/confirm_button.dart';
import '../providers/secret_code_provider.dart';
import '../widgets/app_picture_and_name.dart';
import '../widgets/secret_code_form.dart';

class SecretCodeScreen extends StatelessWidget {
  const SecretCodeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final secretCodeProvider = Provider.of<SecretCodeProvider>(context);

    return Scaffold(
      body: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppPictureAndName(),
                SecretCodeForm(),
                ConfirmButton(
                  child: 'Confirm',
                  onPressed: () async {
                    await secretCodeProvider.checkSecretCode();
                    secretCodeProvider.isValid
                        ? secretCodeProvider.navigateToAuthScreen(context)
                        : Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text(secretCodeProvider.error),
                              backgroundColor: Theme.of(context).errorColor,
                            ),
                          );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
