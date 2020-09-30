import 'package:flutter/cupertino.dart';

class ProfileModel{
  String username="";
  AssetImage profilephoto;
  int followers=0;
  int following=0;
  int post=0;
  String ocupation;
  String country;
  ProfileModel({this.username,this.profilephoto,this.followers,this.following,this.post,this.ocupation,this.country});

}