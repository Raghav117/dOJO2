import 'package:dojo/models/global.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

String update = '';
saveToRealtimeDatabase(context) async {
  await FirebaseDatabase.instance
      .reference()
      .child('Properties')
      .child(dojos[currentlyindex])
      .update({
    "Total_students": update,
  });

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
                    m[dojos[0]]["property_popularity"].toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  SizedBox(width: 140.0),
                  Text('2142',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22))
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  SizedBox(
                    width: 3.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      updateStudents(context);
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
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
