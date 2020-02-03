import 'package:flutter/material.dart';

class DisasterDetail extends StatefulWidget {
  final assetPath, disasterName;
  DisasterDetail({this.assetPath, this.disasterName});

  @override
  _DisasterDetailState createState() => _DisasterDetailState();
}

class _DisasterDetailState extends State<DisasterDetail> {
  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Report this Incidence.?'),
            actions: <Widget>[
              MaterialButton(
                elevation: 5,
                child: Text(
                  'Yes',
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                },
              ),
              MaterialButton(
                elevation: 5,
                child: Text(
                  'No',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Ripoti ChapChap'),
          centerTitle: true,
        ),
        body: Builder(builder: (context) {
          return ListView(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  'Disaster',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Hero(
                tag: widget.assetPath,
                child: Image.asset(
                  widget.assetPath,
                  height: 180,
                  width: 100,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  widget.disasterName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon:
                        Icon(Icons.add_location, size: 30, color: Colors.blue),
                    onPressed: () {},
                  ),
                  RaisedButton(
                    color: Colors.blueAccent,
                    child: Text(
                      'Pick Location',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      labelText: "Description",
                      hintText: "PLease give a small description"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  child: InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width - 50,
                      height: 50,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xFF17ead9), Color(0xFF6078ea)]),
                          borderRadius: BorderRadius.circular(25),
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
                            createAlertDialog(context);
                          },
                          child: Center(
                            child: Text(
                              "Report",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      );
    });
  }
}

class AlertUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SnackBar mySnackBar = SnackBar(
      content: Text('Thanks'),
    );
    Scaffold.of(context).showSnackBar(mySnackBar);
    return Builder(builder: (context) {
      return Scaffold();
    });
  }
}
