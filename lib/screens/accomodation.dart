import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdp_v2/model/cities/bengaluru.dart';
import 'package:sdp_v2/model/cities/delhi.dart';
import 'package:sdp_v2/model/cities/mumbai.dart';
import 'package:sdp_v2/model/cities/nashik.dart';
import 'package:sdp_v2/model/cities/pune.dart';
import 'package:sdp_v2/page/profile_page.dart';
import 'package:sdp_v2/page/profile_page2.dart';
import 'package:sdp_v2/widget/appbar_widget.dart';

class AccomPage extends StatefulWidget {
  static const routeName = '/accomodation';
   late final QuerySnapshot userRef;
  @override
  _AccomPageState createState() => _AccomPageState();
}

class _AccomPageState extends State<AccomPage> {
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
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();
    String? dropdownvalue = 'Mumbai';
    // List of items in our dropdown menu
    
    var children2 = [
       Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon:
                      Icon(Icons.arrow_back, size: 35, color: Colors.blue[900]),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Text(
                  'Accommodation',
                  style: TextStyle(color: Colors.white, fontSize: 25),
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
            SizedBox(width: 20,),
            const Center(
              child: Text(
                'Find Accommodation At',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(width: 20,),
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
                      MaterialPageRoute(builder: (context) => NashikPage()),
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
                      MaterialPageRoute(builder: (context) => PunePage()),
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
                      MaterialPageRoute(builder: (context) => MumbaiPage()),
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
                    MaterialPageRoute(builder: (context) => BangPage()),
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
                    MaterialPageRoute(builder: (context) => DelhiPage()),
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
    ];
    return Scaffold(
        backgroundColor: Colors.black45,
        body: Center
        (child: Column(
          children: children2)));
  }
}
