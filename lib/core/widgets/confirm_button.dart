import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {
  ConfirmButton({
    Key key,
    @required this.child,
    @required this.onPressed,
  }) : super(key: key);

  final String child;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);

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
            onPressed: onPressed,
            child: Text(
              child,
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
