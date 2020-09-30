import 'package:chatapp/Screens/AuthenticateScreen/Register.dart';
import 'package:chatapp/Screens/WidgetScreens/Home.dart';
import 'package:chatapp/Screens/WidgetScreens/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/Wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:"wrapper",
      routes: {
        "wrapper":(context)=> Wrapper(),
        "homescreen":(context)=>Home(),
        "register":(context)=>Register(),
        "mainscreen":(context)=>MainScreen()
      },
    );
  }
}
