 
import 'package:chatapp/api/apis.dart';
import 'package:chatapp/helper/dialogs.dart';
  import 'package:flutter/material.dart';
import 'package:get/get.dart';
 
class LoginController extends GetxController{
   
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future loginMethod(context)async{
    String email = emailController.text;
    String password = passwordController.text;
     try {
      await Apis.auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Sign-in successful
      print('Sign-in successful!');
      Dialogs.showSnackbar(context, "Sign-in successful!");
    } catch (e) {
      // Sign-in failed
      print('Sign-in failed. Error: $e');
      Dialogs.showSnackbar(context, "Sign-in failed. Error");
    }
  }

  // Future googleLogin(context) async {
     
  //   GoogleSignIn googleSignIn = GoogleSignIn();
  //   try {
  //     var reslut = await googleSignIn.signIn();
  //     if (reslut == null) {
  //       return;
  //     }
      
  //     final userData = await reslut.authentication;
  //     final credential = GoogleAuthProvider.credential(
  //         accessToken: userData.accessToken, idToken: userData.idToken);
  //     await FirebaseAuth.instance.signInWithCredential(credential);
  //      Get.offAll(()=>HomeScreen());
      
  //   } catch (error) {
  //     log(error.toString());
  //   }
    
  // }

}