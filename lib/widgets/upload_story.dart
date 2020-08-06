import 'dart:io';

import 'package:dojo/pages/home.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as Im;
import 'package:uuid/uuid.dart';
import 'package:dojo/widgets/progress.dart';

final StorageReference storageRef= FirebaseStorage.instance.ref();


class Upload extends StatefulWidget {

  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload>
    with AutomaticKeepAliveClientMixin<Upload> {
  TextEditingController captionController = TextEditingController();
  File file;
  bool isUploading = false;
  String postId = Uuid().v4();

  handleTakePhoto() async {
    Navigator.pop(context);
    File file = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxHeight: 1000,
      maxWidth: 960,
    );
    setState(() {
      this.file = file;
    });
  }

  handleChooseFromGallery() async {
    Navigator.pop(context);
    File file = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      this.file = file;
    });
  }




  selectImage(parentContext) {
    return showDialog(
      context: parentContext,
      builder: (context) {
        return SimpleDialog(
          title: Text("Add Story"),
          children: <Widget>[
            SimpleDialogOption(
                child: Text("Photo with Camera"), onPressed: handleTakePhoto),
                SizedBox(height:10.0),
            SimpleDialogOption(
                child: Text("Image from Gallery"),
                onPressed: handleChooseFromGallery),
                SizedBox(height:10.0),
            SimpleDialogOption(
              child: Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      },
    );
  }

   buildSplashScreen() {
    return  Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset('assets/upload.svg', height: 260.0),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    "Add Story",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
                  ),
                  color: Colors.deepOrange,
                  onPressed: () => selectImage(context)),
            ),
          ],
        ),
      
    );
  }

  clearImage() {
    setState(() {
      file = null;
    });
  }

  compressImage() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(file.readAsBytesSync());
    final compressedImageFile = File('$path/img_$postId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 85));
    setState(() {
      file = compressedImageFile;
    });
  }

  Future<String> uploadImage(imageFile) async {
    StorageUploadTask uploadTask =
    storageRef.child('stories').child('DOJO101').child("post_$postId.jpg").putFile(imageFile);
      
    StorageTaskSnapshot storageSnap = await uploadTask.onComplete;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  
  }


saveToRealtimeDatabase({String mediaUrl}){
  FirebaseDatabase.instance.reference().child('Properties').child('DOJO101').child('property_Stories').set({
    'image':mediaUrl,

  });
    
}



  handleSubmit() async {
    setState(() {
      isUploading = true;
    });
    
    await compressImage();
     await uploadImage(file);
         String mediaUrl = await uploadImage(file);
         saveToRealtimeDatabase(
           mediaUrl:mediaUrl,
         );
         

      setState(() {
      file = null;
      isUploading = false;
      postId = Uuid().v4();
    });
    
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
  }

  Scaffold buildUploadForm() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: clearImage),
        title: Text(
          "Caption Post",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          FlatButton(
            onPressed: isUploading ? null : () => handleSubmit(),
            child: Text(
              "Post",
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          isUploading ? linearProgress() : Text(""),
          Container(
            height: 220.0,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Center(
              child: AspectRatio(
                aspectRatio: 16/9,
                child: Container(
                  
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(file),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
          ),
          ListTile(
            leading:CircleAvatar(
                   maxRadius: 25.0,
                   backgroundImage: AssetImage('assets/dojo1.png'),
                 ),
            title: Container(
              width: 250.0,
              child: TextField(
                controller: captionController,
                decoration: InputDecoration(
                  hintText: "Write a caption...",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Divider(),
          
          
        ],
      ),
    );
  }

  

  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return file == null ? buildSplashScreen() : buildUploadForm();
  }
}
