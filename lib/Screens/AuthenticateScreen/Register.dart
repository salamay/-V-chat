import 'package:flutter/material.dart';
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _email;
  String _password;
  String _confirmpassword;
  String _error=" ";
  final _formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(0.0),
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
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
                          hintText:"Enter new Email",
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
                      validator: (val)=> val.length < 8?"pasword must not be less than 8":null,
                      onChanged:(val){setState(()=>_password=val);},
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Password",
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
                    SizedBox(height: 20.0),
                    TextFormField(
                      validator: (val)=> val!=_password?"pasword do not match":null,
                      onChanged:(val){setState(()=>_confirmpassword=val);},
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Confirm Password",
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
                          print(_confirmpassword);
                          setState(() {
                            _error=" ";
                          });
                        }else{
                          setState(() {
                            _error="An error occur";
                          });
                        }
                      },
                      color: Colors.pink,
                      child: Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                        _error,
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
