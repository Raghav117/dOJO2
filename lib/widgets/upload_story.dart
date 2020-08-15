import 'dart:io';
import 'dart:math';

import 'package:dojo/models/global.dart';
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

final StorageReference storageRef = FirebaseStorage.instance.ref();

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

  String caption = "";

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
            SizedBox(height: 10.0),
            SimpleDialogOption(
                child: Text("Image from Gallery"),
                onPressed: handleChooseFromGallery),
            SizedBox(height: 10.0),
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
    return Container(
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
    StorageUploadTask uploadTask = storageRef
        .child('stories')
        .child(dojos[currentlyindex])
        .child("post_$postId.jpg")
        .putFile(imageFile);

    StorageTaskSnapshot storageSnap = await uploadTask.onComplete;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }

  saveToRealtimeDatabase({String mediaUrl}) {
    FirebaseDatabase.instance
        .reference()
        .child('Stories')
        .child(dojos[currentlyindex])
        .child(Random().nextInt(2000).toString())
        .set({
      "image": mediaUrl,
      "caption": caption,
      "date": DateTime.now().toString()
    });
    print(mediaUrl);
  }

  handleSubmit() async {
    setState(() {
      isUploading = true;
    });

    await compressImage();
    String mediaUrl = await uploadImage(file);
    saveToRealtimeDatabase(
      mediaUrl: mediaUrl,
    );

    setState(() {
      file = null;
      isUploading = false;
      postId = Uuid().v4();
    });

    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  Scaffold buildUploadForm() {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.red),
            onPressed: clearImage),
        title: Row(
          children: <Widget>[
            CircleAvatar(
              maxRadius: 25.0,
              backgroundImage: AssetImage('assets/dojo1.png'),
            ),
            SizedBox(
              width: 6.0,
            ),
            Text(
              'DOJO001',
              style: TextStyle(fontSize: 18.0),
            )
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          isUploading ? linearProgress() : Text(""),
          Container(color: Colors.black, child: Image.file(file)),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
          ),
          ListTile(
            leading: Icon(
              Icons.photo_library,
              color: Colors.white,
              size: 25.0,
            ),
            title: Container(
              width: 250.0,
              child: TextField(
                controller: captionController,
                onChanged: (value) {
                  caption = value;
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Add a caption....",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
              ),
            ),
            trailing: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: IconButton(
                  onPressed: isUploading ? null : () => handleSubmit(),
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
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
