 
 import 'package:chatapp/controller/auth/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "ChatterBee",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          //  crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             SizedBox(
              height: 150,
            ),
            Center(
              child: Image.asset(
                "assets/logo.png",
                width: 200,
                height: 200,
              ),
            ),
            // with custom text
            SizedBox(
              height: 60,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: 50,
              child: SignInButtonBuilder(
              
                icon:FontAwesomeIcons.google,
                text: "Sign in with Google",
                onPressed: () {
                  loginController.googleLogin(context);
                },
                elevation: 5,
                shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
                backgroundColor: Colors.blueGrey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
