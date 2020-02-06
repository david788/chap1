import 'package:chap/Admin/AdminLogin.dart';
import 'package:chap/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LaunchPage extends StatelessWidget {
  Widget horizontalLine() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          width: 100,
          height: 1,
          color: Colors.black26.withOpacity(.2),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text(
              'Ripoti ChapChap',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).primaryColorDark, fontSize: 40),
            ),
          ),
          SliverFillRemaining(
            // hasScrollBody: true,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset("images/image_01.png", height: 170,),
                ),
                SizedBox(
                  height: 15,
                ),
                Material(
                  elevation: 10,
                  child: InkWell(
                    child: Container(
                      width: 330,
                      height: 100,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xFF17ead9), Color(0xFF6078ea)]),
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFF6078ea).withOpacity(.3),
                                offset: Offset(0.0, 8.0),
                                blurRadius: 8.0),
                          ]),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: Center(
                            child: Text(
                              "Client",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 34),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    horizontalLine(),
                    Text(
                      'or',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    horizontalLine(),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Material(
                  elevation: 10,
                  child: InkWell(
                    child: Container(
                      width: 330,
                      height: 100,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xFF17ead9), Color(0xFF6078ea)]),
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFF6078ea).withOpacity(.3),
                                offset: Offset(0.0, 8.0),
                                blurRadius: 8.0),
                          ]),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdminLoginPage()));
                          },
                          child: Center(
                            child: Text(
                              "Admin",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 34),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
