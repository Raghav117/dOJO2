// class Story {
//    String image;
//    String name;
//   Story(this.image, this.name);
// }

class DojoStories {
  String dojoName;
  List<Story> stories = List();
  DojoStories.fromJson(key, value) {
    dojoName = key;
    Map dojoData = value;
    dojoData.forEach((key, value) {
      print(key);
      print(value);
      if (value != null) stories.add(Story.fromJson(dojoName, key, value));
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
