import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_editor_pro/image_editor_pro.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
class TakePictures extends StatefulWidget {
  final CameraDescription camera;
  TakePictures({this.camera});
  @override
  _TakePicturesState createState() => _TakePicturesState();
}

class _TakePicturesState extends State<TakePictures> {
  CameraController _controller;
  Future<void> _initializeController;
  File _image;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=CameraController(
        widget.camera,
        ResolutionPreset.high
    );
    _initializeController=_controller.initialize();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Future<void>_ShowImageEditor(String path){
     Image image= Image.file(File(path));
      final geteditimage= Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(
              fullscreenDialog: true,
              builder: (BuildContext context)=> ImageEditorPro(
                appBarColor: Hexcolor("#121212"),
                bottomBarColor: Hexcolor("#121212"),
              )
          )
      ).then((geteditimage){
        print(geteditimage);
        if(geteditimage!=null){
          setState(() {
            _image=geteditimage;
          });
        }
      }).catchError((er){
        print(er);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Take a picture",style: TextStyle(color: Colors.white70),),
      ),
      body: FutureBuilder<void>(
        future: _initializeController,
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            return CameraPreview(_controller);
          }else{
            return Center(
              child: CircularProgressIndicator(backgroundColor: Hexcolor("#121212"),),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.camera_alt,
          size: 40,
          color: Colors.red,
        ),
        onPressed: ()async{
          try{
            await _initializeController;
            final path=join((await getTemporaryDirectory()).path,'${DateTime.now()}.png');
            await _controller.takePicture(path);
            _ShowImageEditor(path);
          }catch(e){
            print(e);
          }
        },
      ),
    );
  }
}





