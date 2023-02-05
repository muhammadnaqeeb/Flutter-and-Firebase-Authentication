import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/services/firebase_auth_methods.dart';
import 'package:firebase_authentication/widgets/custom_button.dart';
import 'package:firebase_authentication/widgets/custom_textfield.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class EmailPasswordLogin extends StatefulWidget {
  static String routeName = "/login-email-pasword";
  const EmailPasswordLogin({super.key});

  @override
  State<EmailPasswordLogin> createState() => _EmailPasswordLoginState();
}

class _EmailPasswordLoginState extends State<EmailPasswordLogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // this will avoid any memory leaks
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void loginUser() {
    // FirebaseAuthMethods(FirebaseAuth.instance).loginWithEmail(
    //   email: emailController.text,
    //   password: passwordController.text,
    //   context: context,
    // );
    //OR
    context.read<FirebaseAuthMethods>().loginWithEmail(
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Login",
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: emailController,
              hintText: "Enter your email",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: passwordController,
              hintText: "Enter your password",
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          CustomButton(onTap: loginUser, text: "Login ")
        ],
      ),
    );
  }
}
