import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_details_provider.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    final userDetailsProvider = Provider.of<UserDetailsProvider>(context);

    return Row(
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
            onPressed: () {
              userDetailsProvider.navigateToRouteScreen(context);
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
    );
  }
}
