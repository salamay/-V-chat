import 'package:chatapp/Models/ProfileModel.dart';
import 'package:chatapp/Models/image/PostedImage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:toggle_switch/toggle_switch.dart';
class ProfilePage extends StatefulWidget {
  List <ProfileModel> ProfileData=[
    ProfileModel(username: "@Foxy",profilephoto: AssetImage('asset/sample6.jpg'),post: 28,followers: 34,following: 4,ocupation:"Artist",country:"Nigeria"),
  ];
  List <PostedImage> postedphoto=[
    PostedImage(postedphoto: AssetImage('asset/day2.jpeg')),
    PostedImage(postedphoto: AssetImage('asset/day2.jpeg')),
    PostedImage(postedphoto: AssetImage('asset/background.jpeg')),
    PostedImage(postedphoto: AssetImage('asset/day.jpg')),
    PostedImage(postedphoto: AssetImage('asset/sample5.jpg')),
    PostedImage(postedphoto: AssetImage('asset/background.jpeg')),
    PostedImage(postedphoto: AssetImage('asset/day2.jpeg')),
    PostedImage(postedphoto: AssetImage('asset/sample1.jpg')),
    PostedImage(postedphoto: AssetImage('asset/background.jpeg')),
    PostedImage(postedphoto: AssetImage('asset/day2.jpeg')),
    PostedImage(postedphoto: AssetImage('asset/day.jpg')),
    PostedImage(postedphoto: AssetImage('asset/background.jpeg')),
    PostedImage(postedphoto: AssetImage('asset/sample5.jpg')),
    PostedImage(postedphoto: AssetImage('asset/day2.jpeg')),
    PostedImage(postedphoto: AssetImage('asset/day2.jpeg')),
    PostedImage(postedphoto: AssetImage('asset/day.jpg')),
    PostedImage(postedphoto: AssetImage('asset/background.jpeg')),
    PostedImage(postedphoto: AssetImage('asset/sample1.jpg')),
    PostedImage(postedphoto: AssetImage('asset/day2.jpeg')),
    PostedImage(postedphoto: AssetImage('asset/day.jpg')),
    PostedImage(postedphoto: AssetImage('asset/day2.jpeg')),
    PostedImage(postedphoto: AssetImage('asset/day2.jpeg')),
    PostedImage(postedphoto: AssetImage('asset/day2.jpeg')),
  ];
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _tag="profile-photo";
  bool isClicked=true;
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Hexcolor('#121212'),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>FullImage(tag: _tag,photo: widget.ProfileData[0].profilephoto)));
                    },
                    child: Hero(
                      tag: _tag,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: widget.ProfileData[0].profilephoto,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.ProfileData[0].username,
                          style: TextStyle(
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70
                          ),
                        ),
                        Icon(
                          Icons.verified_user,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                    Text(
                        widget.ProfileData[0].ocupation,
                        style: TextStyle(
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70
                      ),
                    ),
                    Text(
                      widget.ProfileData[0].country,
                      style: TextStyle(
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Post",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                        letterSpacing: 2.0,
                      ),
                    ),
                    Text(
                      widget.ProfileData[0].post.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10.0),
                Column(
                  children: <Widget>[
                    Text(
                      "Followers",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                        letterSpacing: 2.0,
                      ),
                    ),
                    Text(
                      widget.ProfileData[0].followers.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10.0),
                Column(
                  children: <Widget>[
                    Text(
                      "Following",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                        fontSize: 15.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                    Text(
                      widget.ProfileData[0].following.toString(),
                      style: TextStyle(
                          color: Colors.white70,
                          letterSpacing: 1.0,
                          fontSize: 24.0
                      ),
                    )
                  ],
                ),
              ],
            ),
            Divider(
              height: 5.0,
              color: Colors.grey,
            ),
            SizedBox(height: 4.0),
            GestureDetector(
              onVerticalDragUpdate: (DragUpdateDetails details){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>onDragView(profileModel: widget.ProfileData[0].profilephoto,postedphoto: widget.postedphoto)));
              },
              child: FlatButton.icon(
                label: Text(
                    'SWIPE UP',
                  style: TextStyle(
                    color: Colors.white30,
                  ),
                ),
                icon: Icon(
                  Icons.arrow_upward,
                  color: Colors.white30,
                ),
              ),
            ),
            Expanded(
              flex:1,
              child: GridHolder(postedimage:widget.postedphoto)
            ),

          ],
        ),
      ),
    );
  }
}
class FullImage extends StatelessWidget {
  String tag="";
  AssetImage photo;
  FullImage({this.tag,this.photo});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        child: Hero(
          tag: tag,
          child: Image(
            image: photo,
          ),
        ),
      ),
    );
  }
}
class onDragView extends StatelessWidget {
  AssetImage profileModel;
  List<PostedImage> postedphoto;
  onDragView({this.profileModel,this.postedphoto});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor:Hexcolor('#121212'),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              child: Image(
                fit: BoxFit.fitWidth,
                 image: profileModel
                ),
            ),
          ),

          Expanded(
            flex: 2,
              child: Grid(postedphoto: postedphoto
              ))
        ],
      ),
    );
  }
}
class Grid extends StatefulWidget {
  List<PostedImage> postedphoto;

  Grid({this.postedphoto});
  @override
  _GridState createState() => _GridState();
}

class _GridState extends State<Grid> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragStart: (DragStartDetails details){
        print(details);
      },
      child: Container(
        color:  Hexcolor('#121212'),
        height: 20,
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: GridView.count(
              crossAxisCount: 4,
              children:List.generate(widget.postedphoto.length, (index){
                return Card(
                  color: Hexcolor('#121212'),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>FullImage(tag: "posted"+index.toString(),photo: widget.postedphoto[index].postedphoto)));
                    },
                    child: (
                        Image(
                          image: widget.postedphoto[index].postedphoto,
                        )
                    ),
                  ),
                );
              })
          ),
        ),
      ),
    );
  }
}

class Grid2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Hexcolor('#121212')
    );
  }
}
class GridHolder extends StatefulWidget {
  List<PostedImage> postedimage;
  int _index=0;
  GridHolder({this.postedimage});
  @override
  _GridHolderState createState() => _GridHolderState();
}

class _GridHolderState extends State<GridHolder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageViewBuild(widget.postedimage),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50.0,
        index: widget._index,
        onTap: (index) {
          setState(()=>
          widget._index=index
          );
        },
        backgroundColor: Colors.black45,
        color: Hexcolor('#121212'),
        items: <Widget>[
          Icon(Icons.camera_alt, color: Colors.white30),
          Icon(Icons.video_label, color: Colors.white30)
        ],
      ),
    );
  }

  Widget PageViewBuild(List<PostedImage> postedphoto) {
    return PageView(
      controller: PageController(
          initialPage: widget._index,
          keepPage: true
      ),
      onPageChanged: (index) {
        setState(() {
          widget._index=index;
        });
      },
      children: <Widget>[
        Grid(postedphoto:widget.postedimage),
        Grid2(),
      ],
    );
  }
}
