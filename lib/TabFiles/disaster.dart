import 'package:flutter/material.dart';
class OtherDisaster extends StatefulWidget {
  @override
  _OtherDisasterState createState() => _OtherDisasterState();
}

class _OtherDisasterState extends State<OtherDisaster> {
    final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverFillRemaining(
child: Form(
  key: formKey,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    mainAxisSize: MainAxisSize.min
    ,
    children: <Widget>[

      Padding(
              padding: const EdgeInsets.only(right: 16, top: 16),
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    labelText: "Describe the incidence",
                    helperText: "What happened"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Description required";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    labelText: "Location of incidence",
                    helperText: "Roughly where you are now"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Location required";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Expanded(
            //   child: Container(height: 400,width: 400,),
            //   // child: _imageView(),
            // ),
            Container(
              height: 380,
              width: 400,
              child: Padding(
                padding: const EdgeInsets.only(top: 8, right: 16),
                child: Card(
                  borderOnForeground: true,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // _imageView()
                        ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Text(
                  "Capture Photo",
                  style: TextStyle(fontSize: 25),
                ),
                IconButton(
                  icon: Icon(
                    Icons.add_a_photo,
                    size: 30,
                    color: Colors.blueAccent,
                  ),
                  onPressed: () {
                    // _showChoiceDialog(context);

                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => UploadPhoto()));
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                RaisedButton(
                  color: Colors.blueAccent,
                  child: Text(
                    'Pick Location',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    // _launchUrl("https://www.google.com/maps/@-0.6988916,37.1001645,12902m/data=!3m1!1e3");
                  },
                ),
                Icon(
                  Icons.add_location,
                  size: 35,
                  color: Colors.blueAccent,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Material(
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
                        // _submit();
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
          


    ],
  ),
  
),
          ),
        ],
      ),
      
    );
  }
}