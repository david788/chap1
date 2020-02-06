import 'package:chap/DisasterPage.dart';
import 'package:chap/TabFiles/Advice.dart';
import 'package:chap/TabFiles/Contacts.dart';
import 'package:chap/TabFiles/DisasterSpecificationPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView(
        // scrollDirection: Axis.vertical,
        
        
        padding: EdgeInsets.only(left: 20),
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
         
          TabBar(
          
            controller: _tabController,
            indicatorColor: Colors.transparent,
            labelColor: Color(0xFFC88D67),
            isScrollable: true,
            labelPadding: EdgeInsets.only(right: 45),
            unselectedLabelColor: Color(0xFFCDCDCD),
            tabs: <Widget>[
              Tab(
                child: Text(
                  'Disaster',
                  style: TextStyle(fontSize: 21),
                ),
              ),
              Tab(
                child: Text(
                  'Other',
                  style: TextStyle(fontSize: 21),
                ),
              ),
              Tab(
                child: Text(
                  'Contacts',
                  style: TextStyle(fontSize: 21),
                ),
              ),
              Tab(
                child: Text(
                  'Advice',
                  style: TextStyle(fontSize: 21),
                ),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                DisasterPage(),
                DisasterSpecificationPage(),
                ContactsPage(),
                AdvicePage(),
              ],
            ),
          ),
          SizedBox(height: 10,),
          
        ],

        
      ),
     
    );
  }
}
