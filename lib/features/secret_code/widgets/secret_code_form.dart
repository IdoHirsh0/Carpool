import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/secret_code_provider.dart';

class SecretCodeForm extends StatelessWidget {
  SecretCodeForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final secretCodeProvider = Provider.of<SecretCodeProvider>(context);

    return Padding(
      padding: EdgeInsets.all(10),
      child: Form(
        key: null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              obscureText: !secretCodeProvider.showSecretCode,
              decoration: InputDecoration(
                labelText: 'Enter your secret code',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    secretCodeProvider.changeShowSecretCode();
                  },
                  child: Icon(
                    secretCodeProvider.showSecretCode
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
              ),
              // Updates the secretCode variable on every change
              onChanged: (secretCode) {
                secretCodeProvider.changeSecretCode(secretCode);
              },
              // Checks the users
              onFieldSubmitted: (_) async {
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
            // This flat button is just for the UI
            FlatButton(
              onPressed: () {},
              child: Text('Forgot your code?'),
            ),
          ],
        ),
      ),
    );
  }
}
