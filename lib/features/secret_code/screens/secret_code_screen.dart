import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Providers import
import '../../../core/providers/providers.dart';
import '../../../core/widgets/confirm_button.dart';
import '../widgets/app_picture_and_name.dart';
import '../widgets/secret_code_form.dart';

class SecretCodeScreen extends HookWidget {
  const SecretCodeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final secretCodeProvider = useProvider(globalSecretCodeProvider);

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
                              duration: Duration(seconds: 2),
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
