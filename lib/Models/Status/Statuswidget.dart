import 'package:chatapp/Models/Status/StatusModel.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
class StatusView extends StatefulWidget {
  StatusModel status;
  StatusView({this.status});
  @override
  _StatusViewState createState() => _StatusViewState();
}

class _StatusViewState extends State<StatusView> {
  @override
  Widget build(BuildContext context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 9.0),
          child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 34.0,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 32,
                        backgroundImage: widget.status.profilephoto,
                      ),
                    ),
                    Text(
                        widget.status.username,
                      style: TextStyle(
                        color: Colors.white70
                      ),
                    ),
                  ],
                ),
          ),
        );


  }
}
