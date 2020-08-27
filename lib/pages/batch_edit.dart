import 'package:dojo/models/global.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class BatchEdit extends StatefulWidget {
  @override
  _BatchEditState createState() => _BatchEditState();
}

class _BatchEditState extends State<BatchEdit> {
  String batchTiming1 = m[dojos[currentlyindex]]["property_batch1_timing"];
  String batch1 = m[dojos[currentlyindex]]["property_batch1"];
  @override
  void initState() {
    print(batchTiming1);
    print(batch1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Edit Batch Edit',
          style: TextStyle(color: Colors.black, fontSize: 24.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Align(alignment: Alignment.topLeft, child: Text('BATCH 1:')),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                initialValue: m[dojos[currentlyindex]]["property_batch1"],
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onChanged: (value) {
                  batch1 = value;
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              Align(alignment: Alignment.topLeft, child: Text('Timings:')),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                initialValue: m[dojos[currentlyindex]]
                    ["property_batch1_timing"],
                style: TextStyle(
                  color: Colors.black,
                ),
                onChanged: (value) {
                  batchTiming1 = value;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Align(alignment: Alignment.topLeft, child: Text('BATCH 2:')),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                initialValue: "Monday",
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
              Align(alignment: Alignment.topLeft, child: Text('Timings:')),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                initialValue: "7.00 PM TO 8.00 PM",
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
              Align(alignment: Alignment.topLeft, child: Text('BATCH 3:')),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                initialValue: "NA",
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
              Align(alignment: Alignment.topLeft, child: Text('Timings:')),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                initialValue: "NA",
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
              Align(alignment: Alignment.topLeft, child: Text('Batch 4:')),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                initialValue: "NA",
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              Align(alignment: Alignment.topLeft, child: Text('Timings')),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                initialValue: "NA",
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
                height: 8.0,
              ),
              RaisedButton(
                color: Colors.green,
                onPressed: () {
                  if (batchTiming1 !=
                      m[dojos[currentlyindex]]["property_batch1_timing"]
                          .toString()) {
                    FirebaseDatabase.instance
                        .reference()
                        .child("Dojo Partner Request")
                        .child(dojos[currentlyindex])
                        .set({"batch1 Timing": batchTiming1});
                  }
                  if (batch1 != m[dojos[currentlyindex]]["property_batch1"]) {
                    FirebaseDatabase.instance
                        .reference()
                        .child("Dojo Partner Request")
                        .child(dojos[currentlyindex])
                        .set({"batch1": batch1});
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
