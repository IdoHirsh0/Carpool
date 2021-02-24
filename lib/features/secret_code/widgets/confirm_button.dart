import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/secret_code_provider.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _secretCodeProvider =
        Provider.of<SecretCodeProvider>(context, listen: false);
    final _deviceSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 1.4 * (_deviceSize.height / 20),
            width: 5 * (_deviceSize.width / 10),
            margin: EdgeInsets.only(bottom: 20),
            child: RaisedButton(
              elevation: 5.0,
              color: theme.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              onPressed: () {
                _secretCodeProvider.checkSecretCode();
              },
              child: Text(
                "Confirm",
                style: TextStyle(
                  color: theme.buttonColor,
                  letterSpacing: 1.5,
                  fontSize: _deviceSize.height / 40,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
