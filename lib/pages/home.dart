import 'package:dojo/models/global.dart';
import 'package:dojo/pages/events.dart';
import 'package:dojo/pages/profile.dart';
import 'package:dojo/pages/search.dart';
import 'package:dojo/pages/timeline.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController;
  int pageIndex = 0;
  bool loading;

  @override
  void initState() {
    loading = true;
    super.initState();
    pageController = PageController();
    fetch();
  }

  Map map = Map();
  fetchData() async {
    if (dojos.length != 0) {
      dojos.clear();
    }
    map.forEach((key, value) async {
      print(key);
      dojos.add(key);
      print(value);
      await FirebaseDatabase.instance
          .reference()
          .child("Properties")
          .child(key.toString())
          .once()
          .then((val) {
        m[key] = val.value;
      }).whenComplete(() {
        print(m);
        setState(() {});
      });

      FirebaseDatabase.instance
          .reference()
          .child("DOJO")
          .child(key.toString())
          .once()
          .then((value) => m1[key] = value.value);
    });

    loading = false;
    setState(() {});
  }

  fetch() async {
    FirebaseDatabase.instance
        .reference()
        .child("Dojo Partner")
        .child(phn)
        .once()
        .then((value) {
      print(value.key);
      print(value.value);
      if (value.value != null) map = value.value;
    }).whenComplete(() {
      fetchData();
    }).catchError((err) {
      loading = false;
      setState(() {});
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return loading == false
        ? dojos.length != 0
            ? Scaffold(
                // key: _scaffoldKey,
                body: PageView(
                  children: <Widget>[
                    Timeline(),
                    Profile(),
                    Events(),
                    Search(),
                  ],
                  controller: pageController,
                  onPageChanged: onPageChanged,
                  physics: NeverScrollableScrollPhysics(),
                ),
                bottomNavigationBar: Material(
                  elevation: 5.0,
                  child: CupertinoTabBar(
                      currentIndex: pageIndex,
                      onTap: onTap,
                      activeColor: Colors.red,
                      items: [
                        BottomNavigationBarItem(icon: Icon(Icons.favorite)),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.account_circle)),
                        BottomNavigationBarItem(icon: Icon(Icons.event)),
                        BottomNavigationBarItem(icon: Icon(Icons.search)),
                      ]),
                ),
              )
            : Scaffold(
                body: Center(
                  child: Text("Sorry,You don't have permission to access..."),
                ),
              )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
