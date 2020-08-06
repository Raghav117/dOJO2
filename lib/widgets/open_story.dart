import 'package:dojo/models/fetchData.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

class OpenStory extends StatefulWidget {
  @override
  _OpenStoryState createState() => _OpenStoryState();
}

class _OpenStoryState extends State<OpenStory> {
  final storyController = StoryController();
  List<FetchData>allData=[];

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }


var _firebaseRef = FirebaseDatabase().reference().child('Properties').child('DOJO101').child('property_Stories');
      

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        StreamBuilder(
          stream: _firebaseRef.onValue,
          builder: (context,snapshot){
              if(!snapshot.hasData){
                return CircularProgressIndicator();
              }
              Map data=snapshot.data.snapshot.value;
              List item=[];
              data.forEach((index, data) =>item.add( {"key":index,...data}));

              return  ListView.builder(
                itemCount: item.length,
                itemBuilder: (context,index){
                    return  StoryView(
            storyItems: [
                StoryItem.pageImage(
                  controller: storyController,
                  url:
                      "https://specials-images.forbesimg.com/imageserve/1183266467/960x0.jpg?fit=scale",
                ),
                StoryItem.pageImage(
                  controller: storyController,
                  url:
                      "https://cosmosmagazine.com/wp-content/uploads/2020/02/180523-mj-full-1440x973.jpg",
                ),
                StoryItem.pageImage(
                  controller: storyController,
                 
                  url:
                      "https://i.guim.co.uk/img/media/baa89483acc416019f3ba93e96fdea36f678f74d/0_118_3398_2039/master/3398.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=7ec27a3e2ff8b557dd34745b94fa3f89",
                ),
             
            ],
            onStoryShow: (s) {
                print("Showing a story");
            },
            onComplete: () {
                print("Completed a cycle");
            },
            progressPosition: ProgressPosition.top,
            repeat: true,
            controller: storyController,
          );
                },
                             
              );
          },
                  
        ),
         Positioned(
           top: 50,
                    child: Row(
               children: <Widget>[
                 IconButton(icon: Icon(Icons.arrow_back,color: Colors.red,size: 30,), onPressed: null),
                 SizedBox(width: 5.0,),
                 CircleAvatar(
                   maxRadius: 25.0,
                   backgroundImage: AssetImage('assets/dojo1.png'),
                 ),
                 SizedBox(width: 10.0,),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,

                   children: <Widget>[
                     Text('DOJO001',style: TextStyle(
                       color: Colors.white,
                       fontSize: 18,
                       fontWeight: FontWeight.bold,
                     ),
                     ),
                     Text('Yesterday,4.35 PM',style: TextStyle(color: Colors.white60),),

                   ],
                 ),
                 SizedBox(
                   width: 100,
                 ),

                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: <Widget>[
                     IconButton(icon: Icon(Icons.more_vert,color: Colors.red,size: 30,), onPressed: null),
                   ],
                 ),
               ],
        ),
        
         ),
        Positioned(
          bottom: 10,
          right: 13,
                  child: GestureDetector(
                    onTap: (){
                    },
                                      child: Container(
            height: 40.0,
            width: 100.0,
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Center(child: Text('VISIT NOW',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
          ),
                  ),
        ),
         ],
      ),

      
    );
  }
}
