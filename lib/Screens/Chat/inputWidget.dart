
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gson/gson.dart';
import 'package:hexcolor/hexcolor.dart';
class inputWidget extends StatefulWidget {
  Function addMessage;
  ScrollController scrollController;
  inputWidget({this.addMessage,this.scrollController});
  @override
  _inputWidgetState createState() => _inputWidgetState();
}

class _inputWidgetState extends State<inputWidget> {
  TextEditingController _textEditingController=new TextEditingController();
  static const _platform=const MethodChannel("SendMessageToAndroid");
  var result;
  String newmessage;
  String type;
  @override
  Widget build(BuildContext context) {
    void sendMessage(String message)async{
      if(message.isNotEmpty){
       result=await _platform.invokeMethod("sendMessage",<String,String>{
          'message':message
        });
       newmessage=result[0];
       type=result[2];
       print("Received message "+newmessage);
      }
      if(result.isNotEmpty){
        widget.addMessage(newmessage,type);
      }
    }
    return Material(
        color: Hexcolor("#121212"),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      color: Colors.white54
                  ),
                  child: TextField(
                    controller: _textEditingController,
                    showCursor: true,
                    autofocus: false,
                    onChanged: (val){
                      setState(() {
                        Timer(Duration(milliseconds: 300), ()=>widget.scrollController.jumpTo(widget.scrollController.position.maxScrollExtent));
                      });
                    },
                    cursorColor: Colors.black45,
                  ),
                ),
                IconButton(
                  onPressed: (){},
                  splashColor: Colors.yellow,
                  icon:Icon(
                    Icons.insert_emoticon,
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            splashColor: Colors.lightGreenAccent,
            onPressed:(){
              if(_textEditingController.text.isNotEmpty){
                Timer(Duration(milliseconds: 300), ()=>widget.scrollController.jumpTo(widget.scrollController.position.maxScrollExtent));
                sendMessage(_textEditingController.text);
                widget.addMessage(_textEditingController.text,"SENT");
                _textEditingController.clear();
              }
            },
            hoverColor: Colors.white,
            icon:Icon(
              Icons.send,
              color: Colors.green,
            ),
          ),
          IconButton(
            onPressed: (){
            },
            icon: Icon(
              Icons.mic_none,
              color: Colors.redAccent,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}

