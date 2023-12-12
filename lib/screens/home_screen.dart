import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        leading: Icon(CupertinoIcons.home,color: Colors.white,),
        title: Text("ChatterBee",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: [
          Icon(CupertinoIcons.search,color: Colors.white,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.more_vert,color: Colors.white,),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed:() {
        
      },child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.message,color: Colors.white,),
      ),),
    );
  }
}