import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_details_provider.dart';
import '../../../core/widgets/confirm_button.dart';
import '../widgets/name_and_description_form.dart';

class NameAndDescriptionScreen extends StatelessWidget {
  const NameAndDescriptionScreen({Key key}) : super(key: key);

  static const routeName = '/name-and-description-screen';

  @override
  Widget build(BuildContext context) {
    final userDetailsProvider =
        Provider.of<UserDetailsProvider>(context, listen: false);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NameAndDescriptionForm(),
              SizedBox(height: 50),
              ConfirmButton(
                child: 'Confirm',
                onPressed: () {
                  userDetailsProvider.navigateToRouteScreen(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
