import 'package:dojo/models/global.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        elevation: 3.0,
        backgroundColor: Colors.white,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          children: <Widget>[
            Material(
              elevation: 3.0,
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width - 20,
                color: Colors.grey[200],
                child: ListTile(
                  leading: Text(
                    'Property Name:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  title: Text(m[dojos[currentlyindex]]["property_name"]),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Material(
              elevation: 3.0,
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width - 30,
                color: Colors.grey[200],
                child: ListTile(
                  leading: Text(
                    'Contact Number:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  title: Text(
                      m[dojos[currentlyindex]]["property_instructor_contact"]),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Material(
              elevation: 3.0,
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width - 30,
                color: Colors.grey[200],
                child: ListTile(
                  leading: Text(
                    'Classes:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  title: Text(dojos[currentlyindex]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
