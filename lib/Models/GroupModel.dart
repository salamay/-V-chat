import 'package:flutter/cupertino.dart';

class GroupModel{
  AssetImage profilepicture;
  String username;
  String time;
  String message;
  bool isOnline;
  GroupModel({this.profilepicture,this.username,this.time,this.message,this.isOnline});
}