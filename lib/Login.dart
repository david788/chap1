import 'package:chap/HomePage.dart';
import 'package:chap/MainControllerPage.dart';
import 'package:chap/RegisterPage.dart';
import 'package:chap/Widgets/FormCard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loading = false;
  void toggleLoading() {
    setState(() {
      loading = !loading;
    });
  }

  var email = TextEditingController();
  var password = TextEditingController();
  Future<void> loginUser(var email, var password) async {
    try {
      toggleLoading();
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      toggleLoading();
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => MainControllerPage()));
    } catch (e) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));

      print(e.toString());
    }
  }

  Widget horizontalLine() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          width: 120,
          height: 2,
          color: Colors.black26.withOpacity(.2),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: !loading
          ? Stack(
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
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 60),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image.asset("images/logo.png"),
                            Text(
                              'Ripoti Chapchap',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.blue),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        // FormCard(),
                        Container(
                          width: double.infinity,
                          height: 400,
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
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'login',
                                  style: TextStyle(
                                      fontSize: 45,
                                      color: CupertinoTheme.of(context)
                                          .primaryColor),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text("Email", style: TextStyle(fontSize: 26)),
                                TextField(
                                  controller: email,
                                  decoration: InputDecoration(
                                    hintText: "Enter Email",
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text("Password",
                                    style: TextStyle(fontSize: 26)),
                                TextField(
                                  controller: password,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: "Enter Password",
                                  ),
                                ),
                                SizedBox(
                                  height: 35,
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
                            loginUser(email.text, password.text);
                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainControllerPage()));
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage()));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          : Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(child: Text("please wait..."),),
                Center(child:CupertinoActivityIndicator(),)
              ],
            ),
    );
  }
}
