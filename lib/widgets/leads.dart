import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'constants.dart';
import 'package:dojo/models/global.dart';

class Leads extends StatefulWidget {
  @override
  _LeadsState createState() => _LeadsState();
}

class _LeadsState extends State<Leads>
    with AutomaticKeepAliveClientMixin<Leads> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: Column(
      children: <Widget>[
        m1[dojos[currentlyindex]] != null
            ? Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  height: 140.0,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Container(
                          height: 70,
                          width: 60,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/arrow2.png'))),
                        ),
                        title: Text(
                          m1 != null ? m1[dojos[currentlyindex]]["name"] : "",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(m1 != null
                            ? m1[dojos[currentlyindex]]["phone"]
                            : ""),
                        trailing: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                m1 != null
                                    ? m1[dojos[currentlyindex]]["time"]
                                    : "",
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                              // Text('4.35 PM',
                              //     style: TextStyle(color: Colors.grey[600]))
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 40.0,
                              width: 70.0,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.green),
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Center(
                                  child: Text(
                                'Success',
                                style: TextStyle(color: Colors.green),
                              )),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'He was contacted recently for the enquiry.',
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Container()
      ],
    ));
  }

  @override
  bool get wantKeepAlive => true;
}
