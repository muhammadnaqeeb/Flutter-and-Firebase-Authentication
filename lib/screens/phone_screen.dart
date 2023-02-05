import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/services/firebase_auth_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class PhoneScreen extends StatefulWidget {
  static String routeName = "/phone-screen";
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final TextEditingController phoneController = TextEditingController();

  void phoneSignIn() {
    // FirebaseAuthMethods(FirebaseAuth.instance)
    //     .phoneSignIn(context, phoneController.text);
    // OR
    context
        .read<FirebaseAuthMethods>()
        .phoneSignIn(context, phoneController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: phoneController,
              hintText: "Enter phone number",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(onTap: phoneSignIn, text: "Send otp ")
        ],
      ),
    );
  }
}
