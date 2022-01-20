import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdp_v2/model/cities_roomates-boys/pune.dart';
import 'package:sdp_v2/model/cities_roomates-girls/bengaluru.dart';
import 'package:sdp_v2/model/cities_roomates-girls/delhi.dart';
import 'package:sdp_v2/model/cities_roomates-girls/mumbai.dart';
import 'package:sdp_v2/model/cities_roomates-girls/nashik.dart';
import 'package:sdp_v2/model/cities_roomates-girls/pune.dart';
import 'package:sdp_v2/page/profile_page.dart';
import 'package:sdp_v2/page/profile_page2.dart';
import 'package:sdp_v2/widget/appbar_widget.dart';

class Roomy2Page extends StatefulWidget {
  static const routeName = '/rommate';
  late final QuerySnapshot userRef;
  @override
  _Roomy2PageState createState() => _Roomy2PageState();
}

class _Roomy2PageState extends State<Roomy2Page> {
  final Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();
  List docsList = [];
     var firebaseUser =
                                      FirebaseAuth.instance.currentUser;
                                      
  final CollectionReference ref =
      FirebaseFirestore.instance.collection('Users');
  Future<void> getData() async {
    QuerySnapshot querySnapshot = await ref.get();
    docsList = querySnapshot.docs.map((doc) => doc.data()).toList();
  }
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();
  
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Column(children: [
       Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
               IconButton(icon: Icon(Icons.arrow_back, size: 35, color: Colors.blue[900]),
                    onPressed: () => Navigator.of(context).pop(),
                              ), 
                Text('Roomates For Girls♀️',
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
                MaterialPageRoute(builder: (context) => ProfilePage2(userRef: docsList,)),
              );
            },
          ),
              ],
            ),
        Expanded(
          flex: 1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 20,
              ),
              const Center(
                child: Text(
                  'Select your City',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Center(
                child: Icon(
                  Icons.location_on_rounded,
                  size: 26,
                  color: Colors.indigo[900],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [      
        Row(crossAxisAlignment: CrossAxisAlignment.center, 
        children: [
          SizedBox(width: 50,),
          Center(
            child: new ButtonBar(
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[600],
                    textStyle: TextStyle(
                      fontSize: 20,
                    )
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Nashik2Page()),
                    );
                  },
                  child: const Text('Nashik'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[600],
                    textStyle: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Pune2Page()),
                    );
                  },
                  child: const Text('Pune'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                   primary: Colors.blue[600],
                    textStyle: TextStyle(
                      fontSize: 20,
                    )
                  ),
                  child: const Text('Mumbai'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Mumbai2Page()),
                    );
                  },
                ),
              ],
            ),
          )
        ]),
        SizedBox(height: 20,),
        Row(crossAxisAlignment: CrossAxisAlignment.center, 
        children: [
          SizedBox(width: 80,),
          Center(
            child: new ButtonBar(children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[600],
                    textStyle: TextStyle(
                      fontSize: 20,
                    )
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Bang2Page()),
                  );
                },
                child: const Text('Bengaluru'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[600],
                    textStyle: TextStyle(
                      fontSize: 20,
                    )
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Delhi2Page()),
                  );
                },
                child: const Text('New Delhi'),
              ),
            ]),
          ),
        ]),
        Flexible(
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('images/skyline1.png')),
        ),
      ])
      )
      ]
      ),
    );
  }
}
