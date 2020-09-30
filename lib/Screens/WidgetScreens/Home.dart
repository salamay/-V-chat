import 'package:chatapp/Models/Status/StatusModel.dart';
import 'package:chatapp/Models/Status/Statuswidget.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/Models/image/ImageViewModel.dart';
import 'package:chatapp/Models/image/PostModel.dart';
import 'package:hexcolor/hexcolor.dart';
class Home extends StatelessWidget {
  String tag="post";
  String tag2="post2";
  List<StatusModel> status = [
    StatusModel(username: "Oluwole", profilephoto: AssetImage('asset/sample5.jpg')),
    StatusModel(username: "salam", profilephoto: AssetImage("asset/sample4.jpg")),
    StatusModel(username: "ajayi", profilephoto: AssetImage("asset/sample3.jpg")),
    StatusModel(username: "Lekan", profilephoto: AssetImage("asset/sample2.jpg")),
    StatusModel(username: "Dele", profilephoto: AssetImage("asset/sample1.jpg")),
    StatusModel(username: "Kemi", profilephoto: AssetImage("asset/sample1.jpg")),
    StatusModel(username: "Dele", profilephoto: AssetImage("asset/sample1.jpg")),
    StatusModel(username: "Dele", profilephoto: AssetImage("asset/sample1.jpg")),
    StatusModel(username: "Dele", profilephoto: AssetImage("asset/sample1.jpg")),
    StatusModel(username: "Dele", profilephoto: AssetImage("asset/sample1.jpg")),
    StatusModel(username: "Dele", profilephoto: AssetImage("asset/sample1.jpg")),
    StatusModel(username: "Dele", profilephoto: AssetImage("asset/sample1.jpg")),
    StatusModel(username: "Dele", profilephoto: AssetImage("asset/sample1.jpg")),
  ];
  List<ImagePostModel> post = [
    ImagePostModel(
        username: '@Foxzy',
        profilephoto: AssetImage('asset/sample1.jpg'),
        postedImage: AssetImage('asset/image1.jpeg'),
        time: '10PM',
        imageText: 'i njkh and i habe nd liet hoklsjk hgdsu jsjn hsgh',
        likesCount: 0,
         isLiked: true,
                    ),
    ImagePostModel(
        username: '@Wolex',
        profilephoto: AssetImage('asset/sample2.jpg'),
        postedImage: AssetImage('asset/image2.jpg'),
        time: '12PM',
        imageText: 'www.gmail.com',
        likesCount: 23,
        isLiked: false,
    ),
    ImagePostModel(
        username: '@Annonymous',
        profilephoto: AssetImage('asset/sample3.jpg'),
        postedImage: AssetImage('asset/image3.jpeg'),
        time: '11PM',
        imageText: 'Annonymous is a good boy',
      likesCount: 45,
      isLiked: true,
    ),
    ImagePostModel(
        username: '@Annonymous',
        profilephoto: AssetImage('asset/sample3.jpg'),
        postedImage: AssetImage('asset/image4.jpeg'),
        time: '11PM',
        imageText: 'Annonymous is a good boy',
      likesCount: 105,
      isLiked: false,
    ),
    ImagePostModel(
        username: '@Annonymous',
        profilephoto: AssetImage('asset/sample3.jpg'),
        postedImage: AssetImage('asset/image4.jpeg'),
        time: '11PM',
        imageText: 'Annonymous is a good boy',
      likesCount: 35,
      isLiked: true,
    ),
    ImagePostModel(
        username: '@Annonymous',
        profilephoto: AssetImage('asset/sample3.jpg'),
        postedImage: AssetImage('asset/image7.jpg'),
        time: '11PM',
        imageText: 'Annonymous is a good boy',
      likesCount: 35,
      isLiked: true,
    ),
    ImagePostModel(
        username: '@Annonymous',
        profilephoto: AssetImage('asset/sample3.jpg'),
        postedImage: AssetImage('asset/image2.jpg'),
        time: '11PM',
        imageText: 'Annonymous is a good boy',
      likesCount: 35,
      isLiked: false,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Hexcolor('#121212'),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: ListView.builder(
              addAutomaticKeepAlives: true,
              scrollDirection: Axis.horizontal,
              itemCount: status.length,
              itemBuilder: (context, index) {
                return StatusView(status: status[index]);
              },
            ),
          ),
          SizedBox(height: 8.0),
          Expanded(
            flex: 13,
            child: ListView.builder(
              addAutomaticKeepAlives: true,
                itemCount: post.length,
                itemBuilder: (context, index) {
                  return ImageViewModel(post: post[index],herotag:tag+index.toString(),herotag2:tag2+index.toString());
                }),
          ),
        ],
      ),
    );
  }
}
