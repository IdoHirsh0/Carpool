import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/models/app_user.dart';
import '../../user_details/screens/name_and_description_screen.dart';

class AuthenticationProvider with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  /* Creates an AppUser, uesr I specipied to store it later in firestore
     then navigates to the details screen and provied the user as an argrument
  */
  void signInAndCreateAppUser(BuildContext context, String secretCode) async {
    try {
      final user = await googleSignIn();
      final AppUser appUser = AppUser(
        secretCode: secretCode,
        uid: user.uid.toString().trim(),
        name: user.displayName.toString().trim(),
        email: user.email.toString().trim(),
        phoneNumber: user.phoneNumber.toString().trim(),
        photoURL: user.photoURL.toString().trim(),
        description: null,
        homeAddress: null,
        destinationAddress: null,
      );
      Navigator.of(context).pushNamed(
        NameAndDescriptionScreen.routeName,
        arguments: {
          'appUser': appUser,
        },
      );
    } catch (error) {
      print(error);
    }
  }

  Future<User> googleSignIn() async {
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    final UserCredential authResult =
        await _firebaseAuth.signInWithCredential(credential);
    final User user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = _firebaseAuth.currentUser;
    assert(currentUser.uid == user.uid);

    print('Google sign in');

    notifyListeners();
    return user;
  }

  Future<void> googleSingOut() async {
    await _googleSignIn.signOut();
    // await FirebaseAuth.instance.signOut();
    print('Google sign out');
    notifyListeners();
  }
}
