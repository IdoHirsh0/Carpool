import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SecretCodeProvider with ChangeNotifier {
  String _error;
  bool _isValid;
  bool _showSecretcode = false;

  // Getters
  String get error => _error;
  bool get isValid => _isValid;
  bool get showSecretCode => _showSecretcode;

  void changeShowSecretCode() {
    _showSecretcode = !_showSecretcode;
    notifyListeners();
  }

  // Checks the users secret code
  Future<void> checkSecretCode(String secretCode) async {
    final String firebaseSecretCode = await getFirestoreSecretCode(secretCode);

    // If the secret code is valid
    if (firebaseSecretCode == secretCode) {
      _error = null;
      _isValid = true;
    }
    // If the secret code is not valid
    else {
      _error = 'This secret code is not valid';
      _isValid = false;
    }
    notifyListeners();
  }

  /* Checks if the secret code of the user is in firestore 
     returns the secret code if succeded
     returns null if not
  */
  Future<String> getFirestoreSecretCode(String secretCode) async {
    // Try to fetch the secret codes from firestore
    try {
      QuerySnapshot data = await FirebaseFirestore.instance
          .collection('secret_codes')
          .where('secretCode', isEqualTo: secretCode)
          .get();
      String mySecretCode = data.docs.first['secretCode'];
      return mySecretCode;
    }
    // If failed to fetch the secret codes
    catch (error) {
      return null;
    }
  }
}
