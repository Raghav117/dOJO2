import 'package:dojo/pages/feedback.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class DojoSupport extends StatefulWidget {
  @override
  _DojoSupportState createState() => _DojoSupportState();
}

class _DojoSupportState extends State<DojoSupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Material(
          elevation: 3.0,
          child: GestureDetector(
            onTap: () => UrlLauncher.launch("tel:+919324648692"),
            child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width - 20,
              color: Colors.white,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.call,
                        color: Colors.black,
                        size: 22.0,
                      ),
                      SizedBox(height: 7.0),
                      Text(
                        'Call Us',
                        style: TextStyle(
                          fontSize: 22.0,
                          // fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 4.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Need Help?',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          children: <Widget>[
            Material(
              elevation: 3.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FeedBack()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: 60.0,
                  color: Colors.white,
                  child: ListTile(
                    title: Text('Feedback'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Material(
              elevation: 3.0,
              child: GestureDetector(
                onTap: () => UrlLauncher.launch(
                    'https://dojosports.in/Privacypolicy.html'),
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: 60.0,
                  color: Colors.white,
                  child: ListTile(
                    title: Text('Privacy Policy'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Material(
              elevation: 3.0,
              child: GestureDetector(
                onTap: () => UrlLauncher.launch(
                    'https://dojosports.in/terms%20and%20condition.html'),
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: 60.0,
                  color: Colors.white,
                  child: ListTile(
                    title: Text('Terms & Conditions'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
