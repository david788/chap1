import 'package:flutter/material.dart';

import 'DisasterPage.dart';
import 'TabFiles/Advice.dart';
import 'TabFiles/Contacts.dart';
import 'TabFiles/DisasterSpecificationPage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
      }
    
      @override
      Widget build(BuildContext context) {
        return DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Padding(
                padding: EdgeInsets.only(top: 5),
                child: _myAppBar(),
              ),
              bottom: TabBar(
                isScrollable: true,
                indicatorColor: Colors.white,
                labelColor: Color(0xFFC88D67),
                labelPadding: EdgeInsets.only(right: 45),
                unselectedLabelColor: Color(0xFFCDCDCD),
                indicatorWeight: 6,
                onTap: (index) {
                  setState(() {
                    switch (index) {
                    }
                  });
                },
                tabs: <Widget>[
                  Tab(
                    child: Container(
                      child: Text(
                        'Disaster',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text(
                        'Others',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text(
                        'Contacts',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text(
                        'Advice',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: 
                TabBarView(
              controller: _tabController,
              children: <Widget>[
                DisasterPage(),
                DisasterSpecificationPage(),
                ContactsPage(),
                AdvicePage(),
              ],
            ),
             
          ),
        );
      }
    
      
}

Widget _myAppBar() {
  return Container(
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: IconButton(
            icon: Icon(Icons.list, color: Colors.blueGrey,),
            onPressed: () {},
          ),
        ),
        Container(
          child: Text(
            "Ripoti ChapChap",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Container(
          child: IconButton(
            icon: Icon(
              Icons.mic,
              color: Colors.blueGrey,
            ),
            onPressed: null,
          ),
        ),
      ],
    ),
  );
}
