  import 'package:chatapp/screens/splash_Screen.dart';
 import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
 import 'package:get/get.dart';
void main()async {
 // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);//help in full screen
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown
  // ]
    
 // );//  orientation  setting
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChatterBee',
      theme: ThemeData(
       
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

 