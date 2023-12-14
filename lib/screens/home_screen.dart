  
import 'package:chatapp/api/apis.dart';
import 'package:chatapp/controller/home/home_controller.dart';
import 'package:chatapp/models/chat_user.dart';
 import 'package:chatapp/widgets/chat_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController =Get.put(HomeController());
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
   
      body:StreamBuilder(
        stream:  Apis.fireStore.collection("users").snapshots(), 
      builder: (context, snapshot) {
         
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
          
        }
        if (snapshot.hasData) {
          
           final data = snapshot.data!.docs;
           // pass data to model
           homeController.chatUserList=data.map((e) => ChatUser.fromJson(e.data())).toList();
            
        }
        if (!snapshot.hasData) {
          return Center(
            child: Text("No User Now",style: TextStyle(
              color: Colors.blueGrey
            ),),
          );
        }
        return  ListView.builder(
        itemCount: homeController.chatUserList.length,
        itemBuilder: (context, index) {
          return  
          ChatCard(
            chatUser: homeController.chatUserList[index],
          );
        },
      );
      },)
 );
  }
}