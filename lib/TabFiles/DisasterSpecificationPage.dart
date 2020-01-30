import 'dart:io';

import 'package:chap/HomePage.dart';
import 'package:chap/MainControllerPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DisasterSpecificationPage extends StatefulWidget {
  @override
  _DisasterSpecificationPageState createState() =>
      _DisasterSpecificationPageState();
}

class _DisasterSpecificationPageState extends State<DisasterSpecificationPage> {
  final formKey = GlobalKey<FormState>();
  var incidencefield = TextEditingController();
  var locationfield = TextEditingController();

  File imageFile;

  _openGallery(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = picture;
    });
    print('image path$imageFile');
    // this.setState({}[imageFile = picture]);
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    // this.setState({}[imageFile = picture]);
    Navigator.of(context).pop();

    setState(() {
      imageFile = picture;
    });
    print('image path$imageFile');
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Select the Source'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: Text('Gallery'),
                      onTap: () {
                        _openGallery(context);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: Text('Camera'),
                      onTap: () {
                        _openCamera(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _imageView() {
    if (imageFile != null) {
      try {
        return Image.file(
          imageFile,
          width: 300,
          height: 400,
        );
      } catch (e) {
        print(e.toString());
      }
    } else {
      return Text('No image selected');
    }
    return null;
  }

// void _launchUrl(String Url)async{
//     if (await canLaunch(Url)){
//       await launch(Url);
//     }
//     else{
//       throw "Could not Launch url";
//     }
//   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return Form(
            key: formKey,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16, top: 16),
                  child: TextFormField(
                    controller: incidencefield,
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
                    controller: locationfield,
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
                  height: 420,
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, right: 16),
                    child: Card(
                      elevation: 8,
                      margin: EdgeInsets.only(right: 4,left: 4),
                      borderOnForeground: true,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[_imageView()],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        _showChoiceDialog(context);

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
                  mainAxisAlignment: MainAxisAlignment.center,
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
                            _submit();
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
          );
        },
      ),
    );
  }

  void _submit() {
    if (formKey.currentState.validate()) {
      setState(() {
        incidencefield.text ="";
        locationfield.text="";
        imageFile=null;
      });
      SnackBar snackBar = SnackBar(
        content: Text(
          "Reported successfully",
          textAlign: TextAlign.center,
        ),
      );
      
      Scaffold.of(context).showSnackBar(snackBar);
      // Navigator.pushReplacement(context,
      //     MaterialPageRoute(builder: (context) => MainControllerPage()));

    }
  }
}
