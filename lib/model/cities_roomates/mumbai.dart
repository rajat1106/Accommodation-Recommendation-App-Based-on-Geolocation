import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdp_v2/page/profile_page.dart';
import 'package:sdp_v2/widget/appbar_widget.dart';

class Mumbai1Page extends StatefulWidget {
  static const routeName = '/mumbai';
  @override
  _Mumbai1PageState createState() => _Mumbai1PageState();
}

class _Mumbai1PageState extends State<Mumbai1Page> {
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();

    return Scaffold(
      backgroundColor: Colors.black45,
      body: Center(
       
      ),
    );
  }
}
