import 'package:flutter/cupertino.dart';

class ImagePostModel{
  String username;
  AssetImage profilephoto;
  AssetImage postedImage;
  String time;
  String imageText;
  bool isLiked;
  int likesCount;

  ImagePostModel({this.username,this.profilephoto,this.postedImage,this.time,this.imageText,this.likesCount,this.isLiked});
  void tooglelike(bool value){
    isLiked=value;
  }
}