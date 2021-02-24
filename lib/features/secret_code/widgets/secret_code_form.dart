import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/secret_code_provider.dart';

class SecretCodeForm extends StatelessWidget {
  SecretCodeForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _secretCodeProvider = Provider.of<SecretCodeProvider>(context);

    return Padding(
      padding: EdgeInsets.all(10),
      child: Form(
        key: null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              obscureText: !_secretCodeProvider.showSecretCode,
              decoration: InputDecoration(
                labelText: 'Enter your secret code',
                errorText: _secretCodeProvider.error,
                suffixIcon: GestureDetector(
                  onTap: () {
                    _secretCodeProvider.changeShowSecretCode();
                  },
                  child: Icon(
                    _secretCodeProvider.showSecretCode
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
              ),
              // Updates the _secretCode variable on every change
              onChanged: (secretCode) {
                _secretCodeProvider.changeSecretCode(secretCode);
              },
              // Checks the users
              onFieldSubmitted: (_) async {
                await _secretCodeProvider.checkSecretCode();
              },
            ),
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
