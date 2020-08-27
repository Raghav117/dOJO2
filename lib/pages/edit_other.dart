import 'package:dojo/models/global.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class OtherEdit extends StatefulWidget {
  @override
  _OtherEditState createState() => _OtherEditState();
}

class _OtherEditState extends State<OtherEdit> {
  String location = m[dojos[currentlyindex]]["prooerty_searchadd"],
      contact = m[dojos[currentlyindex]]["property_instructor_contact"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Edit Contact',
          style: TextStyle(color: Colors.black, fontSize: 24.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            children: <Widget>[
              Align(alignment: Alignment.topLeft, child: Text('Location:')),
              SizedBox(
                height: 10.0,
              ),
              Material(
                elevation: 1.5,
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          onChanged: (value) {
                            location = value;
                          },
                          initialValue: m[dojos[currentlyindex]]
                              ["prooerty_searchadd"],
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(),
                          maxLines: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Align(alignment: Alignment.topLeft, child: Text('Contact:')),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                onChanged: (value) {
                  contact = value;
                },
                initialValue: m[dojos[currentlyindex]]
                        ["property_instructor_contact"]
                    .toString(),
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                color: Colors.green,
                onPressed: () {
                  if (location !=
                      m[dojos[currentlyindex]]["prooerty_searchadd"]) {
                    FirebaseDatabase.instance
                        .reference()
                        .child("Dojo Partner Request")
                        .child(dojos[currentlyindex])
                        .update({"location": location});
                  }
                  if (contact !=
                      m[dojos[currentlyindex]]["property_instructor_contact"]) {
                    FirebaseDatabase.instance
                        .reference()
                        .child("Dojo Partner Request")
                        .child(dojos[currentlyindex])
                        .update({"contact": contact});
                  }
                  Navigator.pop(context);
                },
                child: Text(
                  'SAVE',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
