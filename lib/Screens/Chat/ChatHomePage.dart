import 'dart:async';

import 'package:chatapp/Models/Message/MesageModel.dart';
import 'package:chatapp/Screens/Chat/ChatItemList.dart';
import 'package:chatapp/Screens/Chat/inputWidget.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
class ChatHomePage extends StatefulWidget {
  final GlobalKey statekey=GlobalKey<ChatItemListState>();
  String username="";
  AssetImage profilephoto;
  ChatHomePage({this.username,this.profilephoto});
  @override

  _ChatHomePageState createState() => _ChatHomePageState();
}

class _ChatHomePageState extends State<ChatHomePage> {
  List<MessageModel> messages=[
    MessageModel(message: "hey",time: DateTime.fromMicrosecondsSinceEpoch(1565888474278).toString(),type: "SENT"),
    MessageModel(message: "hello",time: DateTime.fromMicrosecondsSinceEpoch(1565888474278).toString(),type: "RECEIVED"),
    MessageModel(message: "How Are you",time: DateTime.fromMicrosecondsSinceEpoch(1565888474278).toString(),type: "SENT"),
    MessageModel(message: "I am fine",time: DateTime.fromMicrosecondsSinceEpoch(1565888474278).toString(),type: "RECEIVED"),
  ];
  void addMessage(String message,String type){
    print(message+":type: "+type);
    if(type=="SENT"){
      setState(() {
        messages.add(MessageModel(message: message,time: DateTime.now().toString(),type: "SENT"));
      });
    }else{
      setState(() {
        messages.add(MessageModel(message: message,time: DateTime.now().toString(),type: "RECEIVED"));
      });
    }

  }
  final ScrollController listviewcontoller=new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Hexcolor('#121212'),
        title: InkWell(
          splashColor: Colors.white70,
          child: ListTile(
            contentPadding: EdgeInsets.all(10.0),
            leading: CircleAvatar(
              backgroundImage: widget.profilephoto,
              radius: 20.0,
            ),
            title: Text(
              widget.username,
              style: TextStyle(
                color: Colors.white70
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          ChatItemList(messages: messages,scrollController: listviewcontoller),
          inputWidget(addMessage: addMessage,scrollController: listviewcontoller),
        ],
      )
    );
  }
}


