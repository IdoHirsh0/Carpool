import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/models/app_user.dart';
import '../providers/user_details_provider.dart';

class NameAndDescriptionForm extends StatelessWidget {
  const NameAndDescriptionForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, AppUser> aruguments =
        ModalRoute.of(context).settings.arguments;
    final AppUser appUser = aruguments['appUser'];

    final userDetailsProvider = Provider.of<UserDetailsProvider>(context);

    // Get the app user data to the provider
    userDetailsProvider.changeAppUser(appUser);

    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 75,
            backgroundImage: NetworkImage(appUser.photoURL),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              initialValue: appUser.name,
              decoration: InputDecoration(
                labelText: 'Name',
                errorText: userDetailsProvider.nameError,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onChanged: (name) {
                userDetailsProvider.changeName(name);
              },
              onFieldSubmitted: (description) {
                userDetailsProvider.navigateToRouteScreen(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextFormField(
              maxLength: 75,
              maxLines: 3,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: 'What are your interests?',
                hintText: 'I love music',
                errorText: userDetailsProvider.descriptionError,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onChanged: (description) {
                userDetailsProvider.changeDescription(description);
              },
              onFieldSubmitted: (description) {
                userDetailsProvider.navigateToRouteScreen(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
