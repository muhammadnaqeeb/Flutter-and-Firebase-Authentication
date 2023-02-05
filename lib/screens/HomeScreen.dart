import 'package:firebase_authentication/services/firebase_auth_methods.dart';
import 'package:firebase_authentication/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<FirebaseAuthMethods>().user;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // means user is login by google
          if (!user.isAnonymous && user.phoneNumber == null) Text(user.email!),
          //
          if (!user.isAnonymous && user.phoneNumber == null)
            Text(user.providerData[0].providerId),
          // means user is login using phone number
          if (user.phoneNumber != null) Text(user.phoneNumber!),
          Text(user.uid),
          // means email is not varified then we give them button to verify them
          if (!user.emailVerified &&
              !user.isAnonymous &&
              user.phoneNumber == null)
            CustomButton(
              onTap: () {
                context
                    .read<FirebaseAuthMethods>()
                    .sendEmailVerification(context);
              },
              text: "Verify Email",
            ),
          CustomButton(
              onTap: () {
                context.read<FirebaseAuthMethods>().sign_Out(context);
              },
              text: 'Sign Out'),

          CustomButton(
              onTap: () {
                context.read<FirebaseAuthMethods>().deleteAccount(context);
              },
              text: 'Delete'),
        ],
      ),
    );
  }
}
