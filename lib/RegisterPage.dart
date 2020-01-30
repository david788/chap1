import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MainControllerPage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool loading = false;
  void toggleLoading() {
    setState(() {
      loading = !loading;
    });
  }

  var email = TextEditingController();
  var firstpassword = TextEditingController();
  var password = TextEditingController();

  Future<void> registerUser(var email, var password) async {
    try {
      toggleLoading();
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      toggleLoading();
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => MainControllerPage()));
    } catch (e) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => RegisterPage()));

      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: !loading
          ? Stack(
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
                    // Image.asset("images/image_02.png")
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
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Register Here',
                                  style: TextStyle(
                                      fontSize: 40,
                                      color: CupertinoTheme.of(context)
                                          .primaryColor),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text("Email", style: TextStyle(fontSize: 26)),
                                TextField(
                                  controller: email,
                                  decoration: InputDecoration(
                                    hintText: "Enter Valid Email",
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text("Password",
                                    style: TextStyle(fontSize: 26)),
                                TextField(
                                  controller: firstpassword,
                                  // controller: firstpassword,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: "Enter Password",
                                  ),
                                ),
                                Text("Password",
                                    style: TextStyle(fontSize: 26)),
                                SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  controller: password,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: "Confirm Password",
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
                                        "Clear",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      onPressed: () {
                                        TextEditingController().clear();
                                      },
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
                            'SignUp',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            registerUser(email.text, password.text);
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
            )
            // :Center(child:CupertinoActivityIndicator() ,),
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
