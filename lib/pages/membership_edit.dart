import 'package:dojo/models/global.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MembershipEdit extends StatefulWidget {
  @override
  _MembershipEditState createState() => _MembershipEditState();
}

class _MembershipEditState extends State<MembershipEdit> {
  String registrationfee =
      m[dojos[currentlyindex]]["property_registration_fee"];
  String monthlyfee = m[dojos[currentlyindex]]["property_monthly_membership"];
  String months3 = m[dojos[currentlyindex]]["property_3_months_membership"];
  String months6 = m[dojos[currentlyindex]]["property_6_months_membership"];
  String yearly = m[dojos[currentlyindex]]["property_yearly_membership"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Edit Membership',
          style: TextStyle(color: Colors.black, fontSize: 24.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Align(
                  alignment: Alignment.topLeft,
                  child: Text('Registration Fees:')),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                initialValue: "₹" +
                    m[dojos[currentlyindex]]["property_registration_fee"]
                        .toString(),
                style: TextStyle(
                  color: Colors.black,
                ),
                onChanged: (value) {
                  registrationfee = value;
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
              Align(alignment: Alignment.topLeft, child: Text('Monthly Fees:')),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                initialValue: ' ₹' +
                    m[dojos[currentlyindex]]["property_monthly_membership"],
                style: TextStyle(
                  color: Colors.black,
                ),
                onChanged: (value) {
                  monthlyfee = value;
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
              Align(
                  alignment: Alignment.topLeft, child: Text('3 Months Fees:')),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                initialValue:
                    '₹${m[dojos[currentlyindex]]["property_3_months_membership"]}',
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onChanged: (value) {
                  months3 = value;
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              Align(
                  alignment: Alignment.topLeft, child: Text('6 Months Fees:')),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                initialValue:
                    '₹${m[dojos[currentlyindex]]["property_6_months_membership"]}',
                style: TextStyle(
                  color: Colors.black,
                ),
                onChanged: (value) {
                  months6 = value;
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
              Align(alignment: Alignment.topLeft, child: Text('Yearly Fees:')),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                onChanged: (value) {
                  yearly = value;
                },
                initialValue:
                    '₹${m[dojos[currentlyindex]]["property_yearly_membership"]}',
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
                  if (registrationfee !=
                      m[dojos[currentlyindex]]["property_registration_fee"]) {
                    FirebaseDatabase.instance
                        .reference()
                        .child("Dojo Partner Request")
                        .child(dojos[currentlyindex])
                        .update({"registrationfee": registrationfee});}
                  if (monthlyfee !=
                      m[dojos[currentlyindex]]["property_monthly_membership"]) {
                    FirebaseDatabase.instance
                        .reference()
                        .child("Dojo Partner Request")
                        .child(dojos[currentlyindex])
                        .update({"monthlyfee": monthlyfee});
                  }
                  if (months3 !=
                      m[dojos[currentlyindex]]
                          ["property_3_months_membership"]) {
                    FirebaseDatabase.instance
                        .reference()
                        .child("Dojo Partner Request")
                        .child(dojos[currentlyindex])
                        .update({"month3fee": months3});
                  }
                  if (months6 !=
                      m[dojos[currentlyindex]]
                          ["property_6_months_membership"]) {
                    FirebaseDatabase.instance
                        .reference()
                        .child("Dojo Partner Request")
                        .child(dojos[currentlyindex])
                        .update({"months6fee": months6});
                  }
                  if (yearly !=
                      m[dojos[currentlyindex]]["property_yearly_membership"]) {
                    FirebaseDatabase.instance
                        .reference()
                        .child("Dojo Partner Request")
                        .child(dojos[currentlyindex])
                        .update({"yearlyfee": yearly});
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
