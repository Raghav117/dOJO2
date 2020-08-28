import 'dart:async';

import 'package:dojo/models/container_model.dart';
import 'package:dojo/models/global.dart';
import 'package:dojo/widgets/containers.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Dojo extends StatefulWidget {
  @override
  _DojoState createState() => _DojoState();
}

class _DojoState extends State<Dojo> {
  int index = 1;

  List<Info> _info = [
    Info(text: "Rating", number: m[dojos[0]]["property_rating"].toString()),
    Info(text: "Batches", number: '02'),
    Info(text: "Membership", number: '04'),
    Info(text: "Instructor", number: '01'),
    Info(text: "Other", number: '02'),
  ];
  @override
  void initState() {
    // loading = true;
    super.initState();
    // print("yeah1");
    // timer();
  }

  toggleContainer(index) {
    if (index == 0) {
      return Text('');
    } else if (index == 1) {
      return batches(context);
    } else if (index == 2) {
      return membership(context);
    } else if (index == 3) {
      return Container(
        color: Colors.white,
        height: 230.0,
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: CircleAvatar(
                  maxRadius: 50,
                  backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                m[dojos[currentlyindex]]["property_instructor_name"].toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              SizedBox(height: 7.0),
              Text(
                m[dojos[currentlyindex]]["property_instructor_details"]
                    .toString(),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    } else if (index == 4) {
      return other(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 20, right: 20),
            height: 115.0,
            color: Colors.grey[300],
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _info.length,
              itemBuilder: (context, _index) {
                Info info = _info[_index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      index = _index;
                    });
                    return toggleContainer(index);
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        width: 150.0,
                        color: _index == 0 ? Colors.green : Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                info.text,
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                info.number,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      index == _index && index > 0
                          ? Container(
                              child: Image.asset("assets/polygon.png"),
                            )
                          : Container()
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.grey[300],
            child: Column(
              children: <Widget>[
                toggleContainer(index),
                SizedBox(
                  height: 15.0,
                ),
                bottomContainer(context),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  String update = '';
  saveToRealtimeDatabase(context) async {
    await FirebaseDatabase.instance
        .reference()
        .child('Properties')
        .child(dojos[currentlyindex])
        .update({
      "Total_students": update,
    });

    m[dojos[currentlyindex]]["Total_students"] = update;
    setState(() {});
    // await FirebaseDatabase.instance
    //     .reference()
    //     .child('Properties')
    //     .child('DOJO206')
    //     .child('Total_Students')
    //     .update({
    //   "Total_students": update,
    // });
    Navigator.pop(context);
  }

  updateStudents(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text("Total Students:"),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (val) {
                  update = val;
                },
                initialValue: m[dojos[currentlyindex]]["Total_students"] != null
                    ? m[dojos[currentlyindex]]["Total_students"]
                    : "0",
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RaisedButton(
                color: Colors.green,
                onPressed: () {
                  saveToRealtimeDatabase(context);
                  setState(() {});
                },
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget bottomContainer(context) {
    return Container(
      height: 200.0,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Popularity',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 100.0),
                    Text(
                      'Calls for enquire',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 5.0),
                Row(
                  children: <Widget>[
                    Text(
                      // "asfdasf",
                      m[dojos[currentlyindex]]["property_popularity"]
                          .toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    SizedBox(width: 140.0),
                    Text('2142',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22))
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: <Widget>[
                    Text(
                      'Total Students',
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(width: 80.0),
                    Text(
                      'Stories views',
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  children: <Widget>[
                    Text(
                      m[dojos[currentlyindex]]["Total_students"] != null
                          ? m[dojos[currentlyindex]]["Total_students"]
                          : "0",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        updateStudents(context);
                        setState(() {});
                      },
                      child: Container(
                        height: 25.0,
                        width: 70.0,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Center(
                            child: Text(
                          'Update',
                          style: TextStyle(color: Colors.green),
                        )),
                      ),
                    ),
                    SizedBox(width: 90.0),
                    Text(
                      '193',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
