import 'package:chatapp/models/chat_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatCard extends StatefulWidget {
  final ChatUser chatUser;
  const ChatCard({super.key, required this.chatUser});

  @override
  State<ChatCard> createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
      elevation: 10,
      color: Colors.white,
      child: InkWell(
        onTap: () {
          
        },
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blueGrey,
            child: Icon(CupertinoIcons.person,color: Colors.white,),
          ),
          title: Text(widget.chatUser.name),
          subtitle: Text(widget.chatUser.about,maxLines: 1,),
          trailing: Text(widget.chatUser.lastActive),
        ),
      ),
    );
  }
}