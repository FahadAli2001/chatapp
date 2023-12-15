import 'dart:io';

import 'package:chatapp/api/apis.dart';
import 'package:chatapp/helper/dialogs.dart';
import 'package:chatapp/models/chat_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignUpController extends GetxController{

  final picker = ImagePicker();
  Rx<PickedFile?> _image = Rx<PickedFile?>(null);
  PickedFile? get image => _image.value;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  String? userId;
  String? downloadURL;

   Future<void> getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    _image.value = pickedFile as PickedFile?;
  }

    Future<void> uploadImage() async {
    if (image != null) {
      final User? user = FirebaseAuth.instance.currentUser;
      final String uid = user!.uid;

      Reference ref = FirebaseStorage.instance.ref().child("images/$uid.jpg");
      UploadTask uploadTask = ref.putFile(File(image!.path));

      await uploadTask.whenComplete(() => print('Image uploaded to Firebase'));
      downloadURL = await ref.getDownloadURL();

      // Now, you can save the downloadURL in Firestore or use it as needed
    } else {
      print('No image selected.');
    }
  }


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
    final now = DateTime.now();
    final formattedTime = TimeOfDay.fromDateTime(now);
    String name = emailController.text;
    String about = passwordController.text;

    final chatUser = ChatUser(
      name: name,
       about: about,
       image: downloadURL.toString(),
        createdAt: formattedTime.toString(), 
        id: Uid, 
        isOnline:
         false,
          lastActive: formattedTime.toString(), 
          pushToken: " ", 
          email: email);

          await Apis.fireStore.collection("users").doc(Uid)
          .set(chatUser.toJson());
  }
}