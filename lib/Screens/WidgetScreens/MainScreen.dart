
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:chatapp/Models/Camera/Camera.dart';
import 'package:chatapp/Screens/WidgetScreens/ChatWidget.dart';
import 'package:chatapp/Screens/WidgetScreens/FriendlistWidget.dart';
import 'package:chatapp/Screens/WidgetScreens/Home.dart';
import 'package:chatapp/Screens/WidgetScreens/NotificationWidget.dart';
import 'package:chatapp/Screens/WidgetScreens/profileWidget.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_editor_pro/image_editor_pro.dart';
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _key=GlobalKey<FabCircularMenuState>();
  int _index=0;
  bool fade=false;
  PageController pageController=PageController(
    initialPage: 0,
    keepPage: true
  );
  @override
  Widget build(BuildContext context) {
    Future<void> getCamera()async{
      WidgetsFlutterBinding.ensureInitialized();
      final cameras=await availableCameras();
      final firstcamera=cameras.first;
      Navigator.of(context,rootNavigator: true).push(
          new CupertinoPageRoute<bool>(
            fullscreenDialog: true,
              builder: (BuildContext context)=> TakePictures(camera: firstcamera),
          )
      );
//      runApp(
//          MaterialApp(
//            theme: ThemeData.dark(),
//            home:
//          ));
    }

    void _showCameraSheet(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.all(10.0),
          height: 100.0,
          color: Hexcolor("#121209"),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: ()async{
                    getCamera();
                  },
                  icon: Icon(
                    Icons.camera_alt,
                    size: 50.0,
                    color: Colors.green,
                  ),
                ),
                IconButton(
                  onPressed: ()async{},
                  icon: Icon(
                    Icons.image,
                    size: 50.0,
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          ),
        );
      });
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.black,
        title: Text(
            "CHAT APP",
          textAlign: TextAlign.start,
          style: TextStyle(
            letterSpacing: 3.0
          ),
        ),
        actions: <Widget>[
          AnimatedCrossFade(
            duration: const Duration(seconds: 2),
            firstChild: Icon(Icons.home,size: 30.0,color: Colors.green),
            secondChild: Icon(Icons.home,size: 30.0,color: Colors.blue),
            crossFadeState: fade ? CrossFadeState.showFirst: CrossFadeState.showSecond,
          )
        ],
      ),
      body: PageViewBuild(),
      floatingActionButton: FabCircularMenu(
        key: _key,
        fabOpenIcon: Icon(Icons.menu,color: Colors.white),
        fabElevation: 8.0,
        fabCloseIcon: Icon(Icons.close),
        fabColor: Hexcolor("#343843"),
        fabCloseColor: Colors.redAccent,
        fabOpenColor: Hexcolor('#0D6894'),
        ringColor: Hexcolor('#121212'),
        ringWidth: 50.0,
        ringDiameter: 300.0,
        children: <Widget>[
          IconButton(
            onPressed: (){
              if(_key.currentState.isOpen){
                _key.currentState.close();
                _showCameraSheet();
              }else{
                _key.currentState.close();
              }
            },
            icon: Icon(
              Icons.add_a_photo,
              color: Colors.green,
            ),
          ),
          IconButton(
            onPressed: (){
              if(_key.currentState.isOpen){
                _key.currentState.close();
              }else{
                _key.currentState.close();
              }
            },
            icon: Icon(
              Icons.video_label,
              color: Colors.amberAccent,
            ),
          ),
          IconButton(
            onPressed: (){
              if(_key.currentState.isOpen){
                _key.currentState.close();
              }else{
                _key.currentState.close();
              }
            },
            icon: Icon(
              Icons.videocam,
              color: Colors.red,
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
          items: <Widget>[
            Icon(Icons.home,size: 25.0,color: Colors.white70),
            Icon(Icons.people,size: 30.0,color:   Colors.white70),
            Icon(Icons.chat,size: 30.0,color:  Colors.white70),
            Icon(Icons.notifications_active,size: 30.0,color:  Colors.white70),
            Icon(Icons.person,size: 30.0,color:   Colors.white70)
          ],
        height: 60.0,
        color: Colors.black,
        backgroundColor:Hexcolor('#121212'),
        buttonBackgroundColor: Hexcolor('#121212'),
        index: _index,
        onTap: (index){
            setState((){
              _index=index;
              pageController.jumpToPage(index);
            });
            print(_index);
        },
        animationDuration: Duration(
          milliseconds: 100,
        ),
        animationCurve: Curves.bounceInOut,
      ),
    );
  }
  Widget PageViewBuild(){
    return PageView(
      controller: pageController,
      onPageChanged: (index){
        setState(()=> _index=index);
      },
      children: <Widget>[
        Home(),
        FriendListPage(),
        ChatHolder(),
        NotificationPage(),
        ProfilePage()
      ],
    );
  }
}
