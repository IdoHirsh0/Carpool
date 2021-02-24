import 'package:flutter/material.dart';

class AppPictureAndName extends StatelessWidget {
  const AppPictureAndName({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _deviceSize = MediaQuery.of(context).size;

    return Column(
      children: [
        Column(
          children: [
            SizedBox(height: 50),
            Container(
              height: 250,
              width: 300,
              //TODO: Add the app's picture
              child: Placeholder(),
            ),
          ],
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Text(
                    'Welcome to APP NAME',
                    style: TextStyle(
                      fontSize: _deviceSize.height / 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
