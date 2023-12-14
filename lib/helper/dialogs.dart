import 'package:flutter/material.dart';

class Dialogs{

  static void showSnackbar(BuildContext context,String msg){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg,style: TextStyle(
        color: Colors.black
      ),),
      backgroundColor: Colors.blueGrey,)
    );
  }
}