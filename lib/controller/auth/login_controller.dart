import 'dart:developer';

import 'package:chatapp/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController{

  Future googleLogin(context) async {
     
    GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      var reslut = await googleSignIn.signIn();
      if (reslut == null) {
        return;
      }
      
      final userData = await reslut.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userData.accessToken, idToken: userData.idToken);
      await FirebaseAuth.instance.signInWithCredential(credential);
       Get.offAll(()=>HomeScreen());
      
    } catch (error) {
      log(error.toString());
    }
    
  }

}