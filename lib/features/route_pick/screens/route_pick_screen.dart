import 'package:flutter/material.dart';

import '../../../core/models/app_user.dart';

class RoutePickScreen extends StatelessWidget {
  const RoutePickScreen({Key key}) : super(key: key);

  static const routeName = '/route-pick-screen';

  @override
  Widget build(BuildContext context) {
    final Map<String, AppUser> aruguments =
        ModalRoute.of(context).settings.arguments;
    final appUser = aruguments['appUser'];

    return Scaffold(
      body: Center(
        child: Text(appUser.description),
      ),
    );
  }
}
