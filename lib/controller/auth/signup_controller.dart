import 'package:chatapp/api/apis.dart';
import 'package:chatapp/helper/dialogs.dart';
 import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
   
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future signUpMethod(context)async{
     String email = emailController.text;
    String password = passwordController.text;
    try {
      await Apis.auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Registration successful
      print('Registration successful!');
      Dialogs.showSnackbar(context, "Registration successful!");
    } catch (e) {
      // Registration failed
      print('Registration failed. Error: $e');
      Dialogs.showSnackbar(context, "Registration failed. Error");
    }
  }
}