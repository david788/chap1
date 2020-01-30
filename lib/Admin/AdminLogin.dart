import 'package:chap/Admin/AdminHomePage.dart';
import 'package:chap/Table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminLoginPage extends StatefulWidget {
  @override
  _AdminLoginPageState createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset("images/image_01.png"),
              ),
              Expanded(
                child: Container(),
              ),
              // Container(height: 50,
              // width: 50,
              //   child: Image.asset("images/image_02.png"))
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset("images/logo.png"),
                      Text(
                        'Ripoti Chapchap',
                        style: TextStyle(fontSize: 20, color: Colors.blue),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    width: double.infinity,
                    height: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, 15.0),
                          blurRadius: 15.0,
                        ),
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, -10.0),
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Login',
                            style: TextStyle(fontSize: 45,color: CupertinoTheme.of(context).primaryColor),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Email", style: TextStyle(fontSize: 26)),
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Enter Email",
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Password", style: TextStyle(fontSize: 26)),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Enter Password",
                            ),
                          ),
                          Text("Admin Id", style: TextStyle(fontSize: 26)),
                          SizedBox(height: 20,),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Enter Admin Id",
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              FlatButton(
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CupertinoButton(
                    color: CupertinoTheme.of(context).primaryColor,
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> AdminHomePage()));
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
