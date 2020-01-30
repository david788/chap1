import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  // void _launchUrl(String Url)async{
  //   if (await canLaunch(Url)){
  //     await launch(Url);
  //   }
  //   else{
  //     throw "COuld not Launch url";
  //   }
  // }

  void _launchCaller(int number) async {
    var url = "tel:${number.toString()}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not place a call";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Card(
              elevation: 10,
              child: ListTile(
                leading: Icon(
                  Icons.person_pin_circle,
                  color: Colors.blue,
                  size: 25,
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.call,
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    _launchCaller(0717270578);
                  },
                ),
                title: Text('Kiharu:' +"   " +'Call Us'),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Card(
              elevation: 10,
              child: ListTile(
                leading: Icon(
                  Icons.person_pin_circle,
                  color: Colors.blue,
                  size: 25,
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.call,
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    _launchCaller(0717270578);
                  },
                ),
                title: Text('Mathioya'),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Card(
              elevation: 10,
              child: ListTile(
                leading: Icon(
                  Icons.person_pin_circle,
                  color: Colors.blue,
                  size: 25,
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.call,
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    _launchCaller(0717270578);
                  },
                ),
                title: Text('Maragua'),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Card(
              elevation: 10,
              child: ListTile(
                leading: Icon(
                  Icons.person_pin_circle,
                  color: Colors.blue,
                  size: 25,
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.call,
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    _launchCaller(0717270578);
                  },
                ),
                title: Text('Gatanga'),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Card(
              elevation: 10,
              child: ListTile(
                leading: Icon(
                  Icons.person_pin_circle,
                  color: Colors.blue,
                  size: 25,
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.call,
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    _launchCaller(0717270578);
                  },
                ),
                title: Text('Kangema'),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Card(
              elevation: 10,
              child: ListTile(
                leading: Icon(
                  Icons.person_pin_circle,
                  color: Colors.blue,
                  size: 25,
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.call,
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    _launchCaller(0717270578);
                  },
                ),
                title: Text('Kigumo'),
              ),
            ),
          ),
         
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
