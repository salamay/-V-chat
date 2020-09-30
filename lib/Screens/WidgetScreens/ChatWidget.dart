import 'package:chatapp/Models/ChatModel.dart';
import 'package:chatapp/Models/GroupModel.dart';
import 'package:chatapp/Screens/Chat/ChatHomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

class ChatHolder extends StatefulWidget {
  List<ChatModel> chats = [
    ChatModel(
        profilepicture: AssetImage("asset/sample1.jpg"),
        username: "Salamay",
        time: '2pm',
        message: "hey,whatsup",
        isOnline: true),
    ChatModel(
        profilepicture: AssetImage("asset/sample2.jpg"),
        username: "Foxzy",
        time: '2pm',
        message: "hey,whatsup",
        isOnline: false),
    ChatModel(
        profilepicture: AssetImage("asset/sample3.jpg"),
        username: "Oluwole",
        time: '2pm',
        message:  "hey,whatsup",
        isOnline: false),
    ChatModel(
        profilepicture: AssetImage("asset/sample4.jpg"),
        username: "Salamay",
        time: '2pm',
        message: "hey,whatsup",
        isOnline: true),
    ChatModel(
        profilepicture: AssetImage("asset/sample2.jpg"),
        username: "Salamay",
        time: '2pm',
        message: "hey,whatsup",
        isOnline: false),
    ChatModel(
        profilepicture: AssetImage("asset/sample1.jpg"),
        username: "Salamay",
        time: '2pm',
        message: "hey,whatsup",
        isOnline: true),
    ChatModel(
        profilepicture: AssetImage("asset/sample2.jpg"),
        username: "Salamay",
        time: '2pm',
        message: "hey,whatsup",
        isOnline: true),
    ChatModel(
        profilepicture: AssetImage("asset/sample2.jpg"),
        username: "Salamay",
        time: '2pm',
        message: "hey,whatsup",
        isOnline: false),
  ];
  List<GroupModel> groups = [
    GroupModel(
        profilepicture: AssetImage("asset/sample1.jpg"),
        username: "Class 2017",
        time: '2pm',
        message: "hey,whatsup",
        isOnline: true),
    GroupModel(
        profilepicture: AssetImage("asset/sample2.jpg"),
        username: "Unique",
        time: '2pm',
        message: "hey,whatsup",
        isOnline: false),
    GroupModel(
        profilepicture: AssetImage("asset/sample3.jpg"),
        username: "Islamic ",
        time: '2pm',
        message: "hey,whatsup",
        isOnline: false),
    GroupModel(
        profilepicture: AssetImage("asset/sample4.jpg"),
        username: "ogid group",
        time: '2pm',
        message: "hey,whatsup",
        isOnline: true),
    GroupModel(
        profilepicture: AssetImage("asset/sample2.jpg"),
        username: "JAVA FX",
        time: '2pm',
        message: "hey,whatsup",
        isOnline: false),
    GroupModel(
        profilepicture: AssetImage("asset/sample1.jpg"),
        username: "Python",
        time: '2pm',
        message: "hey,whatsup",
        isOnline: true),
    GroupModel(
        profilepicture: AssetImage("asset/sample2.jpg"),
        username: "C#",
        time: '2pm',
        message: "hey,whatsup",
        isOnline: true),
    GroupModel(
        profilepicture: AssetImage("asset/sample2.jpg"),
        username: "Python",
        time: '2pm',
        message: "hey,whatsup",
        isOnline: false),
  ];

  @override
  _ChatHolderState createState() => _ChatHolderState();
}

class _ChatHolderState extends State<ChatHolder>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  static const platform=const MethodChannel('XmppIntialization');

//Initialize connection
  Future<void>_InitializeXmppConnection()async{
    bool isActive;
    try{
      isActive=await platform.invokeMethod("startXmmppService");
      print(isActive);
    }on PlatformException catch(e){
      print("Failed to initialize Xmmpp Connection");
      print(e);
    }
  }

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      initialIndex: 0,
      vsync: this,
    );
    _InitializeXmppConnection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Hexcolor('#121212'),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(15.0)
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white70,
                  ),
                  onPressed: () async{
                    final result= await showSearch(
                        context: context,
                        delegate: SearchChat(chat: widget.chats, group: widget.groups));
                    print(result);
                  },
                ),
              ),
            ),
          ],
        ),
        bottom: TabBar(
          indicatorColor: Colors.purple,
          unselectedLabelColor: Colors.white30,
          isScrollable: false,
          labelColor: Colors.white,
          tabs: <Widget>[
            Tab(child: Text("Chats")),
            Tab(child: Text("Groups")),
          ],
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 0.5,
                      color: Colors.black45,
                    );
                  },
                  itemCount: widget.chats.length,
                  itemBuilder: (context, index) {
                    return ChatPage(chatmodel: widget.chats[index]);
                  },
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 0.5,
                      color: Colors.black45,
                    );
                  },
                  itemCount: widget.chats.length,
                  itemBuilder: (context, index) {
                    return Grouppage(groupModel: widget.groups[index]);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChatPage extends StatefulWidget {
  ChatModel chatmodel;
  GroupModel groupModel;
  int counter = 2;
  ChatPage({this.chatmodel});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Material(
        color: Hexcolor('#121212'),
        child: ListTile(
          contentPadding: const EdgeInsets.all(5.0),
          leading: Stack(
            children: <Widget>[
              CircleAvatar(
                radius: 30.0,
                backgroundImage: widget.chatmodel.profilepicture,
              ),
              Positioned(
                left: 6.0,
                bottom: 0.0,
                child: Container(
                  height: 11.0,
                  width: 11.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9.0),
                  ),
                  child: Container(
                    height: 4.0,
                    width: 4.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.0),
                      color: widget.chatmodel.isOnline
                          ? Colors.lightGreenAccent
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
          title: Text(
            widget.chatmodel.username,
            style: TextStyle(color: Colors.white70),
          ),
          subtitle: Text(
            widget.chatmodel.message,
            style: TextStyle(
              color: Colors.white30,
            ),
          ),
          trailing: Column(
            children: <Widget>[
              Text(
                widget.chatmodel.time,
                style: TextStyle(color: Colors.white30, fontSize: 10.0),
              ),
              SizedBox(height: 5.0),
              widget.counter != 0
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: Colors.white,
                      ),
                      child: Text(
                        widget.counter.toString(),
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              ///////ChatScreen
              return ChatHomePage(username: widget.chatmodel.username,profilephoto: widget.chatmodel.profilepicture);
            })
            );
          },
        ),
      ),
    );
  }
}

class Grouppage extends StatefulWidget {
  GroupModel groupModel;
  int _counter = 2;

  Grouppage({this.groupModel});

  @override
  _GrouppageState createState() => _GrouppageState();
}

class _GrouppageState extends State<Grouppage> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Material(
        color: Hexcolor('#121212'),
        child: ListTile(
          contentPadding: const EdgeInsets.all(5.0),
          leading: Stack(
            children: <Widget>[
              CircleAvatar(
                radius: 30.0,
                backgroundImage: widget.groupModel.profilepicture,
              ),
              Positioned(
                left: 6.0,
                bottom: 0.0,
                child: Container(
                  height: 11.0,
                  width: 11.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9.0),
                  ),
                  child: Container(
                    height: 4.0,
                    width: 4.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.0),
                      color: widget.groupModel.isOnline
                          ? Colors.lightGreenAccent
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
          title: Text(
            widget.groupModel.username,
            style: TextStyle(color: Colors.white70),
          ),
          subtitle: Text(
            widget.groupModel.message,
            style: TextStyle(
              color: Colors.white30,
            ),
          ),
          trailing: Column(
            children: <Widget>[
              Text(
                widget.groupModel.time,
                style: TextStyle(color: Colors.white30, fontSize: 10.0),
              ),
              SizedBox(height: 5.0),
              widget._counter != 0
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: Colors.white,
                      ),
                      child: Text(
                        widget._counter.toString(),
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
          onTap: () {},
        ),
      ),
    );
  }
}

class SearchChat extends SearchDelegate {
  List<ChatModel> chat;
  List<GroupModel> group;

  SearchChat({this.chat, this.group});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: Colors.black45,
        ),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final result = chat.where((c) => c.username.contains(query));
    final result2 = group.where((g) => g.username.contains(query));
    if (result.isEmpty && result2.isEmpty) {
      return Center(
        child: Text(
          "Friends not found",
          style: TextStyle(color: Colors.white70),
        ),
      );
    } else {
      return Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              color: Hexcolor("#121212"),
              child: ListView(
                children: result
                    .map((c) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: c.profilepicture,
                    radius: 30.0,
                  ),
                  subtitle: Text(
                    c.username,
                    style: TextStyle(color: Colors.white70),
                  ),
                  onTap: () {
                    close(context, c);
                  },
                ))
                    .toList(),
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Container(
              color: Hexcolor("#121212"),
              child: ListView(
                children: result2
                    .map((g) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: g.profilepicture,
                    radius: 30.0,
                  ),
                  subtitle: Text(
                    g.username,
                    style: TextStyle(color: Colors.white70),
                  ),
                  onTap: () {
                    close(context, g);
                  },
                ))
                    .toList(),
              ),
            ),
          )
        ],
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final result = chat.where((c) => c.username.contains(query));
    final result2 = group.where((g) => g.username.contains(query));
    if (result.isEmpty && result2.isEmpty) {
      return Center(
        child: Text(
          "Friends not found",
          style: TextStyle(color: Colors.white70),
        ),
      );
    } else {
      return Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              color: Hexcolor("#121212"),
              child: ListView(
                children: result
                    .map((c) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: c.profilepicture,
                    radius: 30.0,
                  ),
                  subtitle: Text(
                    c.username,
                    style: TextStyle(color: Colors.white70),
                  ),
                  onTap: () {
                    close(context, c);
                  },
                ))
                    .toList(),
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Container(
              color: Hexcolor("#121212"),
              child: ListView(
                children: result2
                    .map((g) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: g.profilepicture,
                    radius: 30.0,
                  ),
                  subtitle: Text(
                    g.username,
                    style: TextStyle(color: Colors.white70),
                  ),
                  onTap: () {
                    close(context, g);
                  },
                ))
                    .toList(),
              ),
            ),
          )
        ],
      );
    }
  }
}
