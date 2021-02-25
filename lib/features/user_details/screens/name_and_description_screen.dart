import 'package:flutter/material.dart';

import '../widgets/confirm_button.dart';
import '../widgets/name_and_description_form.dart';

class NameAndDescriptionScreen extends StatelessWidget {
  const NameAndDescriptionScreen({Key key}) : super(key: key);

  static const routeName = '/name-and-description-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NameAndDescriptionForm(),
              SizedBox(height: 50),
              ConfirmButton(),
            ],
          ),
        ),
      ),
    );
  }
}
