import 'package:dojo/pages/home.dart';
import 'package:dojo/pages/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';

import 'models/global.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String phoneNo;

  String smsOTP = "";

  String verificationId;

  String errorMessage = '';

  String error;

  // bool loading;

  bool dialogloading;

  FirebaseAuth _auth;

  @override
  void initState() {
    dialogloading = false;
    // loading = false;
    value = true;
    _auth = FirebaseAuth.instance;
    sharedPreferences();

    super.initState();
  }

  sharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool x = prefs.getBool("sign");
    print("this is ");
    print(x);
    if (x == null || x == false) {
    } else {
      Navigator.of(context).pop();
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          // return
          return Home();
        },
      ));
    }
  }

  Future<void> verifyPhone() async {
    final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
      setState(() {
        dialogloading = false;
      });
      this.verificationId = verId;
      smsOTPDialog(context);
    };

    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: this.phoneNo, // PHONE NUMBER TO SEND OTP
          codeAutoRetrievalTimeout: (String verId) {
            //Starts the phone number verification process for the given phone number.
            //Either sends an SMS with a 6 digit code to the phone number specified, or sign's the user in and [verificationCompleted] is called.
            this.verificationId = verId;
          },
          codeSent:
              smsOTPSent, // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.
          timeout: const Duration(seconds: 20),
          verificationCompleted: (AuthCredential phoneAuthCredential) {},
          verificationFailed: (AuthException exceptio) {
            setState(() {
              print(exceptio.message);
              error = "Error Occured";
              dialogloading = false;
            });
          });
    } catch (e) {
      handleError(e);
    }
  }

  bool value;

  Scaffold buildOTP(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: ListView(children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'DOJO',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 35.0,
              ),
              Container(
                height: MediaQuery.of(context).size.height - 300,
                width: MediaQuery.of(context).size.width - 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width - 50,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[600],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'We have sent a "6 digit OTP"',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'on $phn',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  height: 30.0,
                                  width: 68.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(22.0),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Edit',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 18.0),
                                  )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Unable to automatically detect OTP',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: PinInputTextField(
                        keyboardType: TextInputType.number,
                        onSubmit: (val) {
                          smsOTP = val;
                          print(smsOTP);
                        },
                        onChanged: (val) {
                          smsOTP = val;
                        },
                        decoration: BoxLooseDecoration(
                            errorText:
                                errorMessage.length != 0 ? errorMessage : null),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      'Resend OTP',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (smsOTP == "") {
                          errorMessage = "Invalid Code";
                          setState(() {});
                        } else {
                          setState(() {
                            dialogloading = true;
                          });
                          signIn();
                        }
                        //  authenticate the  OTP, and then navigate to homescreen.
                      },
                      child: Container(
                        height: 50.0,
                        width: MediaQuery.of(context).size.width - 100,
                        decoration: BoxDecoration(
                          color: Colors.green[400],
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Center(
                            child: Text(
                          'SIGN IN',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w400),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  smsOTPDialog(BuildContext context) {
    return buildOTP(context);
  }

  // Future<bool> smsOTPDialog(BuildContext context) {
  //   return showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (BuildContext context) {
  //         return !dialogloading
  //             ? AlertDialog(
  //                 title: Text('Enter SMS Code'),
  //                 content: Container(
  //                   padding: EdgeInsets.all(20.0),
  //                   height: MediaQuery.of(context).size.height / 5.63,
  //                   child: TextField(
  //                     decoration: InputDecoration(
  //                         border: OutlineInputBorder(
  //                           borderRadius: BorderRadius.circular(20.0),
  //                         ),
  //                         labelText: "Sms Code",
  //                         hintText: "Sms Code",
  //                         prefixIcon: Icon(Icons.code),
  //                         errorText: errorMessage == "" ? null : errorMessage),
  //                     keyboardType: TextInputType.number,
  //                     onChanged: (value) {
  //                       this.smsOTP = value;
  //                     },
  //                   ),
  //                 ),
  //                 contentPadding: EdgeInsets.all(10),
  //                 actions: <Widget>[
  //                   FlatButton(
  //                     child: Text("Back"),
  //                     onPressed: () {
  //                       errorMessage = "";
  //                       Navigator.of(context).pop();
  //                     },
  //                   ),
  //                   FlatButton(
  //                       child: Text('Done'),
  //                       onPressed: () {
  //                         FocusScope.of(context).requestFocus(new FocusNode());
  // if (smsOTP == "") {
  //   setState(() {
  //     errorMessage = 'Invalid Code';
  //   });
  // } else {
  // setState(() {
  //   dialogloading = true;
  // });
  // signIn();
  //                         }
  //                       })
  //                 ],
  //               )
  //             : Center(
  //                 child: CircularProgressIndicator(),
  //               );
  //       });
  // }

  signIn() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verificationId,
        smsCode: smsOTP,
      );
      final AuthResult authResult =
          await _auth.signInWithCredential(credential);
      final FirebaseUser user = authResult.user;
      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("sign", true);
      Navigator.of(context).pop();
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          // return
          return Home();
        },
      ));
    } catch (e) {
      handleError(e);
    }
  }

  handleError(var error) {
    print(error);
    switch (error.code) {
      case 'ERROR_INVALID_VERIFICATION_CODE':
        FocusScope.of(context).requestFocus(new FocusNode());
        setState(() {
          dialogloading = false;
          errorMessage = 'Invalid Code';
        });
        Navigator.of(context).pop();
        smsOTPDialog(context);
        break;
      default:
        setState(() {
          dialogloading = false;
          errorMessage = error.message;
        });

        break;
    }
  }

  Widget build(BuildContext context) {
    // loading = true;

    return dialogloading == false
        ? value == true
            ? Scaffold(
                backgroundColor: Colors.red,
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'DOJO',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        height: 300,
                        width: 320,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28.0,
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                Text(
                                  'with your',
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            Text(
                              'phone number',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 25.0),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.cancel),
                                    color: Colors.grey,
                                    // onPressed: () {
                                    //   setState(() {
                                    //   });
                                    // },
                                  ),
                                  hintStyle: TextStyle(
                                    letterSpacing: 1.0,
                                    color: Colors.grey,
                                  ),
                                  hintText: "enter number",
                                  errorText: error),
                              style: TextStyle(
                                letterSpacing: 2.0,
                              ),
                              onChanged: (value) {
                                phn = value;
                              },
                            ),
                            SizedBox(
                              height: 50.0,
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  Pattern pattern =
                                      r'^[0][1-9]\d{9}$|^[1-9]\d{9}$';
                                  RegExp regex = RegExp(pattern);
                                  if (!regex.hasMatch(phn)) {
                                    error = "Invalid Number";
                                    setState(() {});
                                  } else {
                                    error = "";
                                    phoneNo = "+91" + phn;
                                    dialogloading = true;
                                    value = false;
                                    setState(() {});

                                    verifyPhone();
                                  } // navigate to otp_screen.dart for the user to enter the otp
                                },
                                child: Container(
                                  height: 45.0,
                                  width: 170,
                                  decoration: BoxDecoration(
                                    color: Colors.green[400],
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'NEXT',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 21.0),
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : buildOTP(context)
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
