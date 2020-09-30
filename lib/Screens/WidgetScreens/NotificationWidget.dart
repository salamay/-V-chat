import 'package:chatapp/Models/NotificationModel.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}
List<Notificationmodel> notifications=[
  Notificationmodel(profilepicture: AssetImage('asset/image1.jpeg'),time: "2pm",message:"@Foxzy tag you and 67 others in a post"),
  Notificationmodel(profilepicture: AssetImage('asset/image3.jpeg'),time: "2pm",message:"@Foxzy and 67 others like your post"),
  Notificationmodel(profilepicture: AssetImage('asset/image2.jpg'),time: "2pm",message:"@Foxzy and 67 others reacted to your post"),
  Notificationmodel(profilepicture: AssetImage('asset/image4.jpeg'),time: "2pm",message:"@Foxzy and 67 others like your post"),
  Notificationmodel(profilepicture: AssetImage('asset/image6.jpg'),time: "2pm",message:"@Foxzy and 67 others reacted to your post"),
  Notificationmodel(profilepicture: AssetImage('asset/image7.jpg'),time: "2pm",message:"@Foxzy and 67 others comment to your post"),
];

class _NotificationPageState extends State<NotificationPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Hexcolor("#121212"),
        title: Text(
          "Notifications",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white
          ),
        ),
        titleSpacing: 2.0,
      ),
      body: Container(
        color: Hexcolor("#121212"),
        child: ListView.separated(
            itemBuilder: (context,index){
              return NotificationWidget(notificationmodel: notifications[index]);
            },
            separatorBuilder: (context,index){
              return Divider(
                height: 0.5,
                color: Colors.black45,
              );
            },
            itemCount:notifications.length
        ),
      ),
    );
  }
}
class NotificationWidget extends StatefulWidget {
  Notificationmodel notificationmodel;
  NotificationWidget({this.notificationmodel});
  @override
  _NotificationWidgetState createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
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
          contentPadding: EdgeInsets.all(2.0),
          leading: CircleAvatar(
            backgroundImage: widget.notificationmodel.profilepicture,
            radius: 30.0,
          ),
          title: Text(
            widget.notificationmodel.message,
            style: TextStyle(
              color: Colors.white70,
              letterSpacing: 2.0
            ),
          ),
          trailing: Text(
            widget.notificationmodel.time,
            style: TextStyle(
              color: Colors.white70
            ),
          ),
        ),
      ),
    );
  }
}

