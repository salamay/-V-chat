import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _email;
  String _password;
  final _formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Card(
        elevation: 0,
        margin: EdgeInsets.all(0),
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(0.0),bottomRight: Radius.circular(500.0),bottomLeft: Radius.circular(100))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
          SizedBox(height: 30.0),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Card(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(150.0),topRight: Radius.circular(30.0),bottomRight: Radius.circular(400.0),bottomLeft: Radius.circular(100.0)),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Sign in",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 25.0
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Form(
                          key: _formkey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              TextFormField(
                                onChanged: (val){setState(()=>_email=val);},
                                validator: (val)=>val.isEmpty | !val.contains("@")?"Provide a valid email":null,
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.email,
                                    ),
                                    hintText:"Email",
                                    fillColor: Colors.white70,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white70,
                                            width: 2.0
                                        )
                                    )
                                ),
                              ),
                              SizedBox(height: 20.0),
                              TextFormField(
                                validator: (val)=> val.length < 6?"Field is empty":null,
                                onChanged:(val){setState(()=>_password=val);},
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: "password",
                                    icon: Icon(
                                      Icons.lock,
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white70
                                        )
                                    )
                                ),
                              ),
                              FlatButton(
                                onPressed: (){
                                  if(_formkey.currentState.validate()){
                                    print(_email);
                                    print(_password);
                                    Navigator.pushReplacementNamed(context, 'mainscreen');
                                  }
                                },
                                color: Colors.pink,
                                child: Text(
                                  "Sign in",
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.0),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height:30.0),
            Card(
              margin: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(0),topRight: Radius.circular(600))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 Center(
                   child: Column(
                     children: <Widget>[
                       FlatButton(
                         child: Text("Forgot your password"),
                         onPressed: (){
                         },
                       ),
                       SizedBox(height: 10.0),
                       FlatButton(
                         child: Text("Don't have an account"),
                         onPressed: (){
                           Navigator.pushNamed(context, 'register');
                         },
                       ),
                     ],
                   ),
                 )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}