// class Story {
//    String image;
//    String name;
//   Story(this.image, this.name);
// }

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DojoStories {
  String dojoName;
  List<Story> stories = List();
  DojoStories.fromJson(key, value) {
    dojoName = key;
    Map dojoData = value;
    dojoData.forEach((key, value) async {
      print(key);
      print(value);
      if (value != null) {
        DateTime date = DateTime.parse(value["date"]);
        print(date);
        var difference = DateTime.now().difference(date);
        if (difference.inHours >= 24) {
          StorageReference reference = await FirebaseStorage.instance
              .getReferenceFromUrl(value["image"]);
          reference.delete().whenComplete(() {
            print("yeah");
          });
          // String filePath = value["image"].replaceAll(
          //     new RegExp(
          //         r'https://firebasestorage.googleapis.com/v0/b/dojo-c2657.appspot.com/o/'),
          //     '');

          // FirebaseStorage.instance.ref().child(filePath).delete().then(
          //     (_) => print('Successfully deleted $filePath storage item'));
          print(dojoName);
          print(key);

          FirebaseDatabase.instance
              .reference()
              .child("Stories")
              .child(dojoName)
              .child(key)
              .remove()
              .whenComplete(() {
            print("Yeah it is deleted");
          });
        } else
          stories.add(Story.fromJson(dojoName, key, value));
      }
    });
  }

  show() {
    int n = stories.length;
    int i = -1;
    while (++i < n) {
      print(stories.length);
      print(stories[i].show());
    }
  }
}

class Story {
  String image;
  String name;
  String id;
  String date;
  String caption;

  Story.fromJson(String dojoName, String dojoId, Map m) {
    name = dojoName;
    id = dojoId;
    date = m["date"];
    image = m["image"];
    caption = m["caption"] == null ? "" : m["caption"];
  }

  show() {
    print("DojoName : " + this.name);
    print("DojoDate : " + this.date);
    print("DojoId : " + this.id);
    print("DojoImage : " + this.image);
    print("DojoCaption : " + this.caption);
  }
  // Story(this.image, this.name, this.id, this.date, this.caption);
}
