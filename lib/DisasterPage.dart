import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'DisasterDetails.dart';

class DisasterPage extends StatefulWidget {
  @override
  _DisasterPageState createState() => _DisasterPageState();
}

class _DisasterPageState extends State<DisasterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.only(right: 15),
            width: MediaQuery.of(context).size.width - 30,
            height: MediaQuery.of(context).size.height - 50,
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10,
              mainAxisSpacing: 15,
              childAspectRatio: 0.8,
              children: <Widget>[
                _buildCard(
                    'Road Accident', "images/accident.png", true, context),
                _buildCard(
                    'Need Ambulance', "images/ambulance.png", true, context),
                _buildCard('Drowning', "images/drowning.png", true, context),
                _buildCard('Fire Outbreak', "images/fire.png", true, context),
                _buildCard('Collapsing Building', "images/collapse.png", true,
                    context),
                _buildCard('Land SLide', "images/landslide.png", true, context),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String name, String imgPath, bool isFavorite, context) {
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  DisasterDetail(assetPath: imgPath, disasterName: name)));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 5,
              ),
            ],
          
            color: Colors.white,
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    isFavorite
                        ? Icon(Icons.verified_user, color: Colors.blueAccent)
                        : Icon(
                            Icons.favorite_border,
                            color: Colors.grey.withOpacity(0.2),
                          ),
                  ],
                ),
              ),
              Hero(
                tag: imgPath,
                child: Container(
                  height: 85,
                  width: 75,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imgPath), fit: BoxFit.fitHeight),
                  ),
                ),
              ),
              SizedBox(
                height: 17,
              ),
              Text(name,
                  style: TextStyle(color: Colors.blueAccent, fontSize: 16)),
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  color: Color(0xFFEBEBEB),
                  height: 1.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
