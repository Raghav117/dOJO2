import 'package:flutter/material.dart';

class Other extends StatefulWidget {
  @override
  _OtherState createState() => _OtherState();
}

class _OtherState extends State<Other> {
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
                          initialValue: "Sanpada",
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
                initialValue: "7506310493",
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
