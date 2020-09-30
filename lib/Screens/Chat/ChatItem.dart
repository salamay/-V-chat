import 'package:chatapp/Models/Message/MesageModel.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
class ChatItem extends StatelessWidget {
  MessageModel messageModel;
  ChatItem({this.messageModel});
  @override
  Widget build(BuildContext context) {
    return messageModel.type =="SENT" ? Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Card(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ) ,
                color: Hexcolor("#121212"),
                child: Container(
                  margin: EdgeInsets.only(left: 10.0),
                  padding: EdgeInsets.all(8.0),
                  width: 150.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.black45,

                  ),
                  child: Text(
                    messageModel.message,
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                child: Text(
                  messageModel.time,
                  style: TextStyle(
                      color: Colors.white12,
                      fontStyle: FontStyle.italic
                  ),
                ),
              ),
            ],
          ),
          Icon(
            Icons.done_all,
            color: Colors.grey,
            size: 10.0,
          )
        ],
      ),
    ) :
    Container(
      margin: EdgeInsets.only(right: 10.0),
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 10.0),
                padding: EdgeInsets.all(8.0),
                width: 150.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.black12,
                ),
                child: Text(
                  messageModel.message,
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  messageModel.time,
                  style: TextStyle(
                      color: Colors.white12,
                      fontStyle: FontStyle.italic
                  ),
                ),
              ),
            ],
          ),
          Icon(
            Icons.done_all,
            color: Colors.grey,
            size: 10.0,
          )
        ],
      ),
    );
  }
}
