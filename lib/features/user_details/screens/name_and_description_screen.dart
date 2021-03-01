import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Providers import
import '../../../core/constants/providers.dart';
import '../../../core/widgets/confirm_button.dart';
import '../widgets/name_and_description_form.dart';

class NameAndDescriptionScreen extends HookWidget {
  const NameAndDescriptionScreen({Key key}) : super(key: key);

  static const routeName = '/name-and-description-screen';

  @override
  Widget build(BuildContext context) {
    final userDetailsProvider = useProvider(globalUserDetailsProvider);

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
