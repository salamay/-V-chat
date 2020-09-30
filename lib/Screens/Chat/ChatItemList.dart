import 'dart:async';

import 'package:chatapp/Models/Message/MesageModel.dart';
import 'package:chatapp/Screens/Chat/ChatItem.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
class ChatItemList extends StatefulWidget {
  List<MessageModel> messages;
  ScrollController scrollController;
ChatItemList({this.messages,this.scrollController});
  @override
  ChatItemListState createState() => ChatItemListState();
}
class ChatItemListState extends State<ChatItemList> {

  @override
  Widget build(BuildContext context) {

    return Flexible(
      child: Container(
        color: Hexcolor('#121219'),
        child: ListView.separated(
          controller: widget.scrollController,
          itemBuilder: (context,index){
              return ChatItem(messageModel:widget.messages[index]);
            },
          separatorBuilder:(context,index){
              return Divider(
                thickness: 0.5,
                color: Colors.black45,
              );
            },
          itemCount:widget.messages.length,
        ),
      ),
    );
  }
}
