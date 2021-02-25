import 'package:flutter/foundation.dart';

class AppUser {
  String secretCode;
  String uid;
  String name;
  String email;
  String phoneNumber;
  String photoURL;
  String description;
  String homeAddress;
  String destinationAddress;

  AppUser({
    @required this.secretCode,
    @required this.uid,
    @required this.name,
    @required this.email,
    @required this.phoneNumber,
    @required this.photoURL,
    @required this.description,
    @required this.homeAddress,
    @required this.destinationAddress,
  });
}
