import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/secret_code_provider.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final secretCodeProvider =
        Provider.of<SecretCodeProvider>(context, listen: false);
    final deviceSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 1.4 * (deviceSize.height / 20),
            width: 5 * (deviceSize.width / 10),
            child: RaisedButton(
              elevation: 5.0,
              color: theme.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
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
              child: Text(
                "Confirm",
                style: TextStyle(
                  color: theme.buttonColor,
                  letterSpacing: 1.5,
                  fontSize: deviceSize.height / 40,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
