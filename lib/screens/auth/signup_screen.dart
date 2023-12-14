import 'package:chatapp/controller/auth/signup_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpController signUpController = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
       // automaticallyImplyLeading: false,
        title: Text(
          "ChatterBee",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            //  crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               SizedBox(
                height: 70,
              ),
              Center(
                child: Image.asset(
                  "assets/logo.png",
                  width: 100,
                  height: 100,
                ),
              ),
              // with custom text
              SizedBox(
                height: 60,
              ),
              TextField(
                controller: signUpController.emailController,
                decoration: InputDecoration(
                  label: Text("Email")
                ),
              ),
               SizedBox(
                height: 10,
              ),
               TextField(
                controller: signUpController.passwordController,
                decoration: InputDecoration(
                  label: Text("password")
                ),
              ),
               SizedBox(
                height: 60,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: 50,
                child:   CupertinoButton(
                  color: Colors.blueGrey,
                  child: Text("SignUp",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),), onPressed: (){
                  signUpController.signUpMethod(context);
                })
              )
            ],
          ),
        ),
      ),
    );
  }
}