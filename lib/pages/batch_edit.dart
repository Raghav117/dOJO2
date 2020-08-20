import 'package:flutter/material.dart';

class Batch extends StatefulWidget {
  @override
  _BatchState createState() => _BatchState();
}

class _BatchState extends State<Batch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Edit Batch',
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
                initialValue: "Monday to Sunday",
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
                initialValue: "7.00 AM to 10.00 AM",
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
              Align(alignment: Alignment.topLeft, child: Text('BATCH 2:')),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                initialValue: "Monday and Tuesday",
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
                onPressed: (){
                  //SOME FUNCTION
                },

                child: Text('SAVE',style: TextStyle(color: Colors.white),),
              
              
              )
            ],
          ),
        ),
      ),
    );
  }
}
