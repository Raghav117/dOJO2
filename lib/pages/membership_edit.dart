import 'package:dojo/models/global.dart';
import 'package:flutter/material.dart';

class MembershipEdit extends StatefulWidget {
  @override
  _MembershipEditState createState() => _MembershipEditState();
}

class _MembershipEditState extends State<MembershipEdit> {
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
                  //SOME FUNCTION
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
