import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormCard extends StatefulWidget {
  @override
  _FormCardState createState() => _FormCardState();
}

class _FormCardState extends State<FormCard> {
  var email = TextEditingController();

  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
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
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'login',
              style: TextStyle(fontSize: 45,color: CupertinoTheme.of(context).primaryColor),
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
            Text("Password", style: TextStyle(fontSize: 26)),
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
    );
  }
}
