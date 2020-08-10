import 'dart:convert';

import 'package:dojo/models/story.dart';
import 'package:dojo/widgets/open_story.dart';
import 'package:dojo/widgets/upload_story.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Stories extends StatefulWidget {
  @override
  _StoriesState createState() => _StoriesState();
}

class _StoriesState extends State<Stories> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    fetchStories();
    _stories = List();
    _dojoStorie = List();
    _dojoStories = List();
    super.initState();
  }

  List<DojoStories> _dojoStorie;
  List<DojoStories> _dojoStories;
  var _firebaseRef;

  fetchStories() async {
    _firebaseRef =
        FirebaseDatabase().reference().child('Stories').once().then((value) {
      Map x = value.value;
      x.forEach((key, value) {
        print(key);
        print(value);
        if (value != null) _dojoStorie.add(DojoStories.fromJson(key, value));
      });
    }).whenComplete(() {
      _dojoStorie.forEach((element) {
        if (element.stories.length == 0 || element.stories == null) {
        } else {
          _dojoStories.add(element);
        }
      });
      //! **********  ToDo  *****************

      setState(() {});
      // for (var z in _dojoStories) print(z.show());
    });
  }

  List<Story> _stories;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(vertical: 10.0),
        height: 90,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _dojoStories.length + 1,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              DojoStories story;
              if (index != 0) story = _dojoStories[index - 1];

              return Stack(
                  // alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        border: Border.all(
                          width: 3,
                          color: index == 0 ? Colors.grey : Colors.red,
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(
                          2,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(70),
                          child: GestureDetector(
                            onTap: () {
                              if (index == 0) {
                                return Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Upload()))
                                    .whenComplete(() {
                                  setState(() {});
                                });
                              } else {
                                // print(story.show());
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return OpenStory(
                                      story: story,
                                    );
                                  },
                                ));
                                //   return Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: (context) =>
                                //               OpenStory(story)));
                              }
                            },
                            child: Image(
                              image: index == 0
                                  ? AssetImage("assets/dojo2.png")
                                  : AssetImage("assets/dojo1.png"),
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Positioned(
                        bottom: 2,
                        left: 20.0,
                        child: Text(
                          index == 0 ? "Upload Story" : story.dojoName,
                          style: TextStyle(color: Colors.grey),
                        )),
                    index == 0
                        ? Positioned(
                            bottom: 30.0,
                            right: 10.0,
                            child: new CircleAvatar(
                              backgroundColor: Colors.blueAccent,
                              radius: 10.0,
                              child: new Icon(
                                Icons.add,
                                size: 14.0,
                                color: Colors.white,
                              ),
                            ))
                        : new Container()
                  ]);
            }));
  }
}
