import 'package:chatapp/controller/auth/login_controller.dart';
import 'package:chatapp/screens/auth/signup_screen.dart';
import 'package:chatapp/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

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
                controller: loginController.emailController,
                decoration: InputDecoration(label: Text("Email")),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: loginController.passwordController,
                decoration: InputDecoration(label: Text("password")),
              ),
              SizedBox(
                height: 60,
              ),
              SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 50,
                  child: CupertinoButton(
                      color: Colors.blueGrey,
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                       // loginController.loginMethod(context);
                       Get.to(HomeScreen());
                      })),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(()=>SignUpScreen());
                },
                child: Text(
                  "Don't have an account? SignUp",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
