import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/showSnackBar.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  // EMAIL SIGN UP
  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required BuildContext context, // use to display snackbar etc
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      // if (e.code == "weak-password") {
      //   // on FirebaseAuthException we can generate custom errors
      //   showSnackBar(context, "Weak Password");
      // }
      showSnackBar(context, e.message!);
    }
  }

  //EMAIL VERIFICATION
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, "Email verification sent!.");
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }
}
