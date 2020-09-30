import 'package:chatapp/Models/FriendsModel.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
class FriendListPage extends StatefulWidget {
  @override
  _FriendListPageState createState() => _FriendListPageState();
}

class _FriendListPageState extends State<FriendListPage> {
  List<FriendModel> _friends=[
    FriendModel(profilepicture: AssetImage("asset/image1.jpeg"),username: "Foxzy",status: "Life is short,Live it",isAccept: true),
    FriendModel(profilepicture: AssetImage("asset/image2.jpg"),username: "Oluwole",status: "Life is short,Live it",isAccept: false),
    FriendModel(profilepicture: AssetImage("asset/image3.jpeg"),username: "Annonymous",status: "Life is short,Live it",isAccept: true),
    FriendModel(profilepicture: AssetImage("asset/image4.jpeg"),username: "Ayo",status: "Life is short,Live it",isAccept: true),
    FriendModel(profilepicture: AssetImage("asset/image2.jpg"),username: "JFLEX",status: "Life is short,Live it",isAccept: false),
    FriendModel(profilepicture: AssetImage("asset/image3.jpeg"),username: "Josephine",status: "Life is short,Live it",isAccept: true),
    FriendModel(profilepicture: AssetImage("asset/image7.jpg"),username: "Salam",status: "Life is short,Live it",isAccept: false),
    FriendModel(profilepicture: AssetImage("asset/image1.jpeg"),username: "Wolex",status: "Life is short,Live it",isAccept: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Hexcolor('#121212'),
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white70,
                ),
                onPressed: () async{
                  final result= await showSearch(
                      context: context,
                      delegate: SearchFriend(friends: _friends));
                  print(result);
                },
              ),
            ),
          ],
        ),
      ),
      body: ListView.separated(
          itemBuilder:(context,index){
            return FriendWidget(friendModel: _friends[index]);
          },
          separatorBuilder: (context,index){
            return Divider(
              height: 0.5,
              color: Colors.black45,
            );
          },
          itemCount: _friends.length
      ),
    );
  }
}
class FriendWidget extends StatefulWidget {
  FriendModel friendModel;
  FriendWidget({this.friendModel});
  @override
  _FriendWidgetState createState() => _FriendWidgetState();
}

class _FriendWidgetState extends State<FriendWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Material(
        color: Hexcolor("#121212"),
        child: ListTile(
        onTap: (){

        },
          leading: CircleAvatar(
            backgroundImage: widget.friendModel.profilepicture,
          ),
          title: Text(
            widget.friendModel.username,
            style: TextStyle(
              color: Colors.white70
            ),
          ),
          subtitle: Text(
            widget.friendModel.status,
            style: TextStyle(
              color: Colors.white30
            ),
          ),
          trailing: widget.friendModel.isAccept?FlatButton(
            onPressed: (){


            },
            color: Colors.grey,
            child: Text(
              "Unfollow"
            ),
          ):
          FlatButton(
            onPressed: (){


            },
            color: Colors.blue,
            child: Text(
              "Follow"
            ),
          )
        ),
      ),
    );
  }
}
class SearchFriend extends SearchDelegate<FriendModel>{
  List<FriendModel> friends;
  SearchFriend({this.friends});
  @override
  List<Widget> buildActions(BuildContext context) {

     return [IconButton(
      icon: Icon(
        Icons.clear,
        color: Colors.black45,
      ),
      onPressed: () {
        query="";
      },
    )
     ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: (){
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {

    final result=friends.where((a)=>a.username.contains(query));
    if(result.isEmpty){
      return Center(
        child: Text(
          "Friends not found",
          style: TextStyle(
              color: Colors.white70
          ),
        ),
      );
    }else{
      return Container(
        color: Hexcolor("#121212"),
        child: ListView(
          children: result.map((f)=>ListTile(
            leading: CircleAvatar(
              backgroundImage: f.profilepicture,
              radius: 30.0,
            ),
            subtitle: Text(
              f.username,
              style: TextStyle(
                  color: Colors.white70
              ),
            ),
            onTap: (){
              close(context, f);
            },
          )
          ).toList(),
        ),
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final result=friends.where((a)=>a.username.contains(query));
    if(result.isEmpty){
      return Center(
        child: Text(
          "Friends not found",
          style: TextStyle(
            color: Colors.white70
          ),
        ),
      );
    }else{
      return Container(
        color: Hexcolor("#121212"),
        child: ListView(
          children: result.map((f)=>ListTile(
            leading: CircleAvatar(
              backgroundImage: f.profilepicture,
              radius: 30.0,
            ),
            subtitle: Text(
              f.username,
              style: TextStyle(
                color: Colors.white70
              ),
            ),
            onTap: (){
              close(context, f);
            },
        )
    ).toList(),
        ),
      );
    }
  }
}
