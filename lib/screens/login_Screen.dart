import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/screens/login_email_password_screen.dart';
import 'package:firebase_authentication/screens/phone_screen.dart';
import 'package:firebase_authentication/screens/signup_email_password_screen.dart';
import 'package:firebase_authentication/services/firebase_auth_methods.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomButton(
              onTap: () {
                Navigator.pushNamed(context, EmailPasswordSignup.routeName);
              },
              text: "Email/password Sign Up",
            ),
            CustomButton(
              onTap: () {
                Navigator.pushNamed(context, EmailPasswordLogin.routeName);
              },
              text: "Email/password Login",
            ),
            CustomButton(
              onTap: () {
                Navigator.pushNamed(context, PhoneScreen.routeName);
              },
              text: "Phone Sign In",
            ),
            CustomButton(
              onTap: () {
                FirebaseAuthMethods(FirebaseAuth.instance)
                    .signInWithGoogle(context);
              },
              text: "Google Sign In",
            ),
            CustomButton(
              onTap: () {},
              text: "Facebook Sign In",
            ),
            CustomButton(
              onTap: () {
                FirebaseAuthMethods(FirebaseAuth.instance)
                    .signInAnonymously(context);
              },
              text: "Anonymous Sign In",
            )
          ],
        ),
      ),
    );
  }
}
