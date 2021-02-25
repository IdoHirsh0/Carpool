import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/authentication/providers/auth_provider.dart';
import 'features/authentication/screens/auth_screen.dart';
import 'features/route_pick/screens/route_pick_screen.dart';
import 'features/secret_code/providers/secret_code_provider.dart';
import 'features/secret_code/screens/secret_code_screen.dart';
import 'features/user_details/providers/user_details_provider.dart';
import 'features/user_details/screens/name_and_description_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SecretCodeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserDetailsProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carpool',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
        // TODO: Add theme
      ),
      home: SecretCodeScreen(),
      routes: {
        AuthScreen.routeName: (ctx) => AuthScreen(),
        NameAndDescriptionScreen.routeName: (ctx) => NameAndDescriptionScreen(),
        RoutePickScreen.routeName: (ctx) => RoutePickScreen(),
      },
    );
  }
}
