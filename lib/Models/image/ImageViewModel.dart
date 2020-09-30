import 'package:chatapp/Models/image/PostModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:like_button/like_button.dart';

class ImageViewModel extends StatefulWidget {
  bool isPostLiked;
  ImagePostModel post;
  String herotag;
  String herotag2;
  ImageViewModel({this.post,this.herotag,this.herotag2});

  @override
  _ImageViewModelState createState() => _ImageViewModelState();
}

class _ImageViewModelState extends State<ImageViewModel> {
  Future<bool> OnLikeButtonClicked(bool isLiked)async{
    //print(isLiked);


    return !isLiked;
  }
  @override
  Widget build(BuildContext context) {
    bool isLike=widget.post.isLiked;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: InkWell(
        child: Material(
          color: Hexcolor('#121212'),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Card(
              elevation: 40.0,
              color: Colors.black26,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 0,
                          child: GestureDetector(
                            child: Hero(
                              tag:widget.herotag,
                              child: CircleAvatar(
                                radius: 20.0,
                                backgroundImage: widget.post.profilephoto,
                              ),
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>FullImage(profilephoto: widget.post.profilephoto,tag: widget.herotag))
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 15.0),
                        Expanded(
                          flex: 4,
                            child: Text(
                                widget.post.username,
                              style: TextStyle(
                                  color: Colors.white70
                              ),
                            )
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            widget.post.time,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 8.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      color:Hexcolor('#121212'),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>FullImageView(postedImage: widget.post.postedImage,tag2: widget.herotag2,)));
                        },
                        child: Hero(
                          tag: widget.herotag2,
                          child: Image(
                              image: widget.post.postedImage,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        LikeButton(
                          onTap:OnLikeButtonClicked,
                          size: 70.0,
                          circleColor: CircleColor(
                            start: Color(0xff00ddff),
                            end: Color(0xff0099cc)
                          ),
                          bubblesColor: BubblesColor(
                            dotPrimaryColor: Color(0xff33b5e5),
                            dotSecondaryColor: Color(0xff0099cc),
                          ),
                          likeBuilder: (bool isLike){
                            widget.isPostLiked=isLike;
                            return Icon(
                              Icons.favorite,
                              size: 70.0,
                              color: widget.isPostLiked?Colors.redAccent:Colors.grey
                            );
                          },
                          likeCount: widget.post.likesCount,
                          countBuilder: (int count,bool isLiked,String text){
                            if(count==0){
                              return Text(
                                "No like",
                               style: TextStyle(
                                 color: Colors.white70
                               ),
                              );
                            }else{
                              return Text(
                                text,
                                style: TextStyle(
                                    color: Colors.white70
                                ),
                              );
                            }
                          },
                        )
                      ],
                    ),
                    Text(
                      widget.post.imageText,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class FullImage extends StatelessWidget {
  AssetImage profilephoto;
  String tag;
  FullImage({this.profilephoto,this.tag});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        color: Colors.black26,
        child: Hero(
          tag: tag,
          child: Container(
            child: Image(
              image: profilephoto,
            ),
          ),
        ),
      ),
    );
  }
}
class FullImageView extends StatelessWidget {
  AssetImage postedImage;
  String tag2;
  FullImageView({this.postedImage,this.tag2});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Container(
          child: Hero(
            tag: tag2,
            child: Image(
              image: postedImage,
            ),
          ),
        ),
      ),
    );
  }
}

