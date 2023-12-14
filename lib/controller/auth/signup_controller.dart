import 'package:chatapp/api/apis.dart';
import 'package:chatapp/helper/dialogs.dart';
import 'package:chatapp/models/chat_user.dart';
 import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
   
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  String? userId;
  Future signUpMethod(context)async{
    String email = emailController.text;
    String password = passwordController.text;
    
    try {
      final credential =await Apis.auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      userId = credential.user!.uid;
      // Registration successful
      print('Registration successful!');
      Dialogs.showSnackbar(context, "Registration successful!");
    } catch (e) {
      // Registration failed
      print('Registration failed. Error: $e');
      Dialogs.showSnackbar(context, "Registration failed. Error");
    }
  }

  Future createUser (String Uid,String email )async{
    String name = emailController.text;
    String about = passwordController.text;

    final chatUser = ChatUser(
      name: name,
       about: about,
       image: "image",
        createdAt: "createdAt", 
        id: Uid, 
        isOnline:
         false,
          lastActive: "lastActive", 
          pushToken: " ", 
          email: email);

          await Apis.fireStore.collection("users").doc(Uid)
          .set(chatUser.toJson());
  }
}