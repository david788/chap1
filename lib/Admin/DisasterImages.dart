import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReportedDisasters extends StatefulWidget {
  @override
  _ReportedDisastersState createState() => _ReportedDisastersState();
}

class _ReportedDisastersState extends State<ReportedDisasters> {
  List<Disasters> disastersList = []; 
  //fetch from firebase child "Disasters"
  List<Disasters> selectedDisaster; 
  //to enable select a row
  bool loading = false;
  void toggleLoading() {
    setState(() {
      loading = !loading;
    });
  }

  onSelectedRow(bool selected, Disasters disaster) async {
    setState(() {
      if (selected) {
        selectedDisaster.add(disaster);
      } else {
        selectedDisaster.remove(disaster);
      }
    });
  }

  @override
  void initState() {
    selectedDisaster = [];
    super.initState();
    DatabaseReference disastersRef =
        FirebaseDatabase.instance.reference().child("Disasters");
    disastersRef.once().then((DataSnapshot snap) {
      var KEYS = snap.value.keys;
      var DATA = snap.value;
      disastersList
          .clear(); //the data to be fetched from firebase in Disasters child nodes
      for (var individualKey in KEYS) {
        Disasters disasters = Disasters(
          DATA[individualKey]["date"],
          DATA[individualKey]["time"],
          DATA[individualKey]["image"],
          DATA[individualKey]["description"],
          DATA[individualKey]["location"],
        );
        disastersList.add(disasters);
      }
      setState(() {
        print('Length: ${disastersList.length}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: disastersList.length == 0
            ? Center(
                // child: Text("loading"),
                child: CupertinoActivityIndicator(
                  radius: 20,
                ),
              )
            : ListView.builder(
                itemCount: disastersList.length,
                itemBuilder: (_, index) {
                  return disastersTableUi(
                      //calls the Table Ui to map the data from firebase
                      disastersList[index].date,
                      disastersList[index].time,
                      disastersList[index].image,
                      disastersList[index].description,
                      disastersList[index].location);
                }),
      ),
      floatingActionButton: FloatingActionButton(
          child: Text('${selectedDisaster.length}'), onPressed: null),
    );
  }

  Widget disastersUi(String date, String time, String image, String description,
      String location) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(10),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    date,
                    style: Theme.of(context).textTheme.subtitle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    time,
                    style: Theme.of(context).textTheme.subtitle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                image,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                location,
                style: Theme.of(context).textTheme.subhead,
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                description,
                style: Theme.of(context).textTheme.subhead,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }

//the DataTable Ui is defined here
  Widget disastersTableUi(String date, String time, String image,
      String description, String location) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          DataColumn(label: Text("TIME"), numeric: false),
          DataColumn(label: Text("DATE"), numeric: false),
          DataColumn(label: Text("DISASTER"), numeric: false),
          DataColumn(label: Text("LOCATION"), numeric: false),
        ],
        rows: disastersList
            .map((disaster) => DataRow(
                    selected: selectedDisaster.contains(disaster),
                    onSelectChanged: (b) {
                      print("Onselect");
                      onSelectedRow(b, disaster);
                    },
                    cells: [
                      DataCell(Text(disaster.time)),
                      DataCell(Text(disaster.date)),
                      DataCell(Text(disaster.description)),
                      DataCell(Text(disaster.location)),
                    ]))
            .toList(),
      ),
    );
  }
}

//the data is accessed through the Disasters class below
class Disasters {
  String date, time, image, description, location;
  Disasters(this.date, this.time, this.image, this.description, this.location);
  List<Disasters> getDisasters() {
    return [Disasters(date, time, image, description, location)];
  }
}
