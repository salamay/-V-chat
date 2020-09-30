import 'package:flutter/cupertino.dart';

class ChatModel{
  AssetImage profilepicture;
  String username;
  String time;
  String message;
  bool isOnline;
  ChatModel({this.profilepicture,this.username,this.time,this.message,this.isOnline});

}