// import 'package:dojo/models/fetchData.dart';
import 'package:dojo/models/story.dart';
import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/story_view.dart';
import 'package:story_view/widgets/story_view.dart';

class OpenStory extends StatefulWidget {
  final DojoStories story;

  const OpenStory({Key key, this.story}) : super(key: key);

  @override
  _OpenStoryState createState() => _OpenStoryState(story);
}

class _OpenStoryState extends State<OpenStory> {
  _OpenStoryState(this.story);

  @override
  void initState() {
    storyItems = List();

    super.initState();
    fillStoryItems();
  }

  List<StoryItem> storyItems;

  final DojoStories story;
  fillStoryItems() {
    print(this.story);
    story.stories.forEach((element) {
      element.show();
      if (element != null)
        storyItems.add(StoryItem.pageImage(
          caption: element.caption,
          url: element.image,
          controller: storyController,
        ));
    });
    setState(() {});
  }

  final storyController = StoryController();

  // List<FetchData>allData=[];

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.red,
                          size: 30,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      CircleAvatar(
                        maxRadius: 25.0,
                        backgroundImage: AssetImage('assets/dojo1.png'),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   width: 5.0,
                  // ),
                  // SizedBox(
                  //   width: 10.0,
                  // ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        story.dojoName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Text(
                      //   ,
                      //   style: TextStyle(color: Colors.white60),
                      // ),
                    ],
                  ),

                  IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.red,
                        size: 30,
                      ),
                      onPressed: null),
                ],
              ),
              Flexible(
                child: StoryView(
                    controller: storyController, // pass controller here too
                    repeat: true,
                    inline: false, // should the stories be slid forever
                    onStoryShow: (s) {},
                    onComplete: () {},
                    onVerticalSwipeComplete: (direction) {
                      if (direction == Direction.down) {
                        Navigator.pop(context);
                      }
                    },
                    storyItems:
                        storyItems // To disable vertical swipe gestures, ignore this parameter.
                    // Preferrably for inline story view.
                    ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 40.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                      child: Center(
                          child: Text(
                        'VISIT NOW',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
