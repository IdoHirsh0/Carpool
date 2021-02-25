import 'package:flutter/material.dart';

import '../../../core/models/app_user.dart';
import '../../route_pick/screens/route_pick_screen.dart';

class UserDetailsProvider with ChangeNotifier {
  String _name;
  String _nameError;
  String _description;
  String _descriptionError;
  bool _isValid = false;

  AppUser _appUser;

  //* Getters
  String get name => _name;
  String get nameError => _nameError;
  String get description => _description;
  String get descriptionError => _descriptionError;
  bool get isValid => _isValid;
  AppUser get appUser => _appUser;

  //* Setters
  void changeName(name) {
    _name = name;
    notifyListeners();
  }

  void changeDescription(description) {
    _description = description;
    notifyListeners();
  }

  void changeAppUser(AppUser appUser) {
    _appUser = appUser;
  }

  //* Other functions
  void navigateToRouteScreen(BuildContext context) {
    checkName();
    checkDescription();
    if (_isValid) {
      AppUser newAppUser = AppUser(
        secretCode: _appUser.secretCode,
        uid: _appUser.uid,
        name: _name,
        email: _appUser.email,
        phoneNumber: _appUser.phoneNumber,
        photoURL: _appUser.photoURL,
        description: _description,
        homeAddress: null,
        destinationAddress: null,
      );
      Navigator.of(context).pushNamed(
        RoutePickScreen.routeName,
        arguments: {
          'appUser': newAppUser,
        },
      );
    }
  }

  void checkName() {
    if (_name == null) {
      print('Name has not changed');
      _name = _appUser.name;
      _nameError = null;
      _isValid = true;
    } else if (_name.length < 3) {
      _nameError = 'Must be at least 3 charcters long';
      _isValid = false;
    } else {
      _nameError = null;
      _isValid = true;
    }
    notifyListeners();
  }

  void checkDescription() {
    if (_description == null) {
      _descriptionError = 'Must be at least 10 characters long';
      _isValid = false;
    } else if (_description.length < 10) {
      _descriptionError = 'Must be at least 10 characters long';
      _isValid = false;
    } else {
      _descriptionError = null;
      _isValid = true;
    }
    notifyListeners();
  }
}