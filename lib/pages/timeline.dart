import 'dart:async';

import 'package:dojo/models/global.dart';
import 'package:dojo/widgets/dojo.dart';
import 'package:dojo/widgets/leads.dart';
import 'package:dojo/widgets/stories.dart';
import 'package:flutter/material.dart';

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline>
    with SingleTickerProviderStateMixin {
  bool loading = true;
  TabController _tabController;
  List<DropdownMenuItem> drop;
  @override
  void initState() {
    loading = true;

    super.initState();
    drop = List();
    makeDrop();
    _tabController = TabController(vsync: this, length: 2);
  }

  makeDrop() {
    dojos.forEach((element) {
      print(element);
      drop.add(DropdownMenuItem(
        child: Text(element),
        value: dojos.indexOf(element),
      ));
    });
    setState(() {});
    timer();
  }

  var x;
  timer() async {
    x = Timer.periodic(Duration(seconds: 1), (timer) {
      if (loading == true)
        setState(() {
          loading = false;
        });
    });
  }

  @override
  void dispose() {
    x.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: loading == false
            ? Row(
                children: <Widget>[
                  Container(
                    child: DropdownButton(
                        value: currentlyindex,
                        // dropdownColor: Colors.red,
                        iconEnabledColor: Colors.red,
                        items: drop,
                        onChanged: (value) {
                          setState(() {
                            currentlyindex = value;
                          });
                          print(m[dojos[currentlyindex]]);
                        }),
                  ),

                  // IconButton(
                  //   onPressed: () {
                  //     //some function
                  //   },
                  //   icon: Icon(
                  //     Icons.notifications_none,
                  //     color: Colors.red,
                  //   ),
                  // )
                ],
              )
            : Text(""),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              //some function
            },
            icon: Icon(
              Icons.notifications_none,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stories(),
          Divider(
            color: Colors.grey[350],
          ),
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.red,
            tabs: <Widget>[
              Tab(
                child: Text(
                  dojos[currentlyindex],
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                  child: Text(
                'LEADS',
                style: TextStyle(color: Colors.black),
              ))
            ],
          ),
          loading == false
              ? Expanded(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: <Widget>[
                      Dojo(),
                      Leads(),
                    ],
                  ),
                )
              : Flexible(
                  child: Center(
                      child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.red),
                  )),
                ),
        ],
      ),
    );
  }
}
