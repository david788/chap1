import 'package:chap/HomePage.dart';
import 'package:chap/TabFiles/Contacts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'MainControllerPages/AboutPage.dart';

class MainControllerPage extends StatefulWidget {
  @override
  _MainControllerPageState createState() => _MainControllerPageState();
}

class _MainControllerPageState extends State<MainControllerPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    AboutPage(),
    ContactsPage(),
  ];
  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ripoti ChapChap'),
        centerTitle: true,
        actions: <Widget>[
          
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        // onTap: onTappedBar,
        //  currentIndex = _currentIndex,

        color: Colors.blueAccent,
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.white,
        height: 50,
        
        items: <Widget>[
         
          Icon(Icons.home, size: 20, color: Colors.black),
          Icon(Icons.list, size: 20, color: Colors.black),
          Icon(Icons.exit_to_app, size: 20, color: Colors.black),
        ],
        animationDuration: Duration(milliseconds: 200),
        animationCurve: Curves.bounceInOut,
        index: 1,
        onTap: (index) {
          onTappedBar(index);
          debugPrint('current index is:$index');
        },
      ),
    );
  }
}
