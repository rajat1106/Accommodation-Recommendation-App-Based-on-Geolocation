import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdp_v2/page/profile_page.dart';
import 'package:sdp_v2/screens/roomate-girls.dart';
import 'package:sdp_v2/screens/roomate_boys.dart';
import 'package:sdp_v2/widget/appbar_widget.dart';

class GenderPage extends StatefulWidget {
  static const routeName = '/gender';
  @override
  _GenderPageState createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
               IconButton(icon: Icon(Icons.arrow_back, size: 35, color: Colors.blue[900]),
                    onPressed: () => Navigator.of(context).pop(),
                              ), 
                Text('Roomates',
                  style: TextStyle (
                    color: Colors.white,
                    fontSize: 25
                  ),
                ),
                IconButton(
            icon: const Icon(Icons.account_circle),
            color: Colors.indigo[900],
            iconSize: 70,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
              ],
            ),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
               mainAxisAlignment: MainAxisAlignment.end,
            children: [
                      Container(child: 
                      ConstrainedBox(
    constraints: BoxConstraints.expand(),
    child: TextButton(onPressed:() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RoomyPage()),
                    );
                  },
        child: Image.asset('gender_boys.jpg')
                  )
                )
            ),
            Container(child: 
                      ConstrainedBox(
    constraints: BoxConstraints.expand(),
    child: TextButton(onPressed:() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Roomy2Page()),
                    );
                  },
        child: Image.asset('gender_girls.jpg')
                  )
                )
            )
                  ],
            ),
          ),
          ],
        ),
        
      ),
    );
  }
  }