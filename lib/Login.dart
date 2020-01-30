import 'package:chap/HomePage.dart';
import 'package:chap/MainControllerPage.dart';
import 'package:chap/RegisterPage.dart';
import 'package:chap/Widgets/FormCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget horizontalLine() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          width: 120,
          height: 3,
          color: Colors.black26.withOpacity(.2),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Stack(
        overflow: Overflow.visible,
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

//this part gave me an error that gave me headache...
// interfering with the container class only to find i pasted the image asset in that class,, weee...
                //  Image.asset("images/image_02.png"),
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
                  FormCard(),
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
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainControllerPage()));
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      horizontalLine(),
                      Text(
                        'or',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      horizontalLine(),
                    ],
                  ),
                  FlatButton(
                    child: Text('Dont have an account.? Create new'),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterPage()));
                    },
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
