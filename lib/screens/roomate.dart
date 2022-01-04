import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdp_v2/page/profile_page.dart';
import 'package:sdp_v2/widget/appbar_widget.dart';

class RoomyPage extends StatefulWidget {
  static const routeName = '/rommate';
  @override
  _RoomyPageState createState() => _RoomyPageState();
}

class _RoomyPageState extends State<RoomyPage> {
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();

    return Scaffold(
      backgroundColor: Colors.black45,
      body: Column(children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: const Icon(Icons.account_circle),
            color: Colors.indigo[900],
            iconSize: 70,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
              // FirebaseFirestore.instance.collection('Users').get().then((value) => Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => ProfilePage(doc: value),
              //     )));
            },
          ),
        ),
        const Flexible(
          child: Center(
            child: Text(
              'Welcome Back',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 60,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ]),
    );
  }
}
