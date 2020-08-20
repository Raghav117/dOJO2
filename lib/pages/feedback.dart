import 'dart:math';

import 'package:dojo/models/global.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  TextEditingController feedbackController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? CircularProgressIndicator()
        : Scaffold(
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: feedbackController.text.toString != ""
                    ? () async {
                        await FirebaseDatabase.instance
                            .reference()
                            .child("Dojo Partner Feedback")
                            .child(dojos[currentlyindex])
                            .update({
                          Random().nextInt(2000).toString():
                              feedbackController.text.toString()
                        }).whenComplete(() {
                          feedbackController.text = "";
                          Navigator.pop(context);
                        });
                      }
                    : () {},
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.green,
                  ),
                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 22.0),
                    ),
                  ),
                ),
              ),
            ),
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 3.0,
              centerTitle: true,
              title: Text(
                'FeedBack',
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.mail,
                        color: Colors.black,
                      ),
                      title: Text("gmail"),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.add_call,
                        color: Colors.black,
                      ),
                      title: Text(m[dojos[currentlyindex]]
                          ["property_instructor_contact"]),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.account_box,
                        color: Colors.black,
                      ),
                      title: Text(
                          m[dojos[currentlyindex]]["property_instructor_name"]),
                    ),
                    SizedBox(height: 15.0),
                    Material(
                      elevation: 4,
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Enter Message..",
                                ),
                                controller: feedbackController,
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return "Enter a valid Message";
                                  } else {
                                    return null;
                                  }
                                },
                                // onFieldSubmitted: (val) async {
                                //   await FirebaseDatabase.instance
                                //       .reference()
                                //       .child("Dojo Partner Feedback")
                                //       .child(dojos[currentlyindex])
                                //       .set({val: true}).whenComplete(() {
                                //     feedbackController.text = "";
                                //     Navigator.pop(context);
                                // });
                                // },
                                maxLines: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
