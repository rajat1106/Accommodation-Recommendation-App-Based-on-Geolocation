import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdp_v2/page/profile_page2.dart';
import 'package:sdp_v2/widget/appbar_widget.dart';

class Nashik1Page extends StatefulWidget {
  static const routeName = '/nashik';
  @override
  _Nashik1PageState createState() => _Nashik1PageState();
}

class Person {
  String name;
  String profileImg;
  String bio;

  Person({
  required this.name,
  required this.profileImg,
  required this.bio
  });
}

class _Nashik1PageState extends State<Nashik1Page> {
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
                Text('Nashik',
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
            Column(
              children: persons.map((p) {
                return personDetailCard(p);
              }).toList()
            )
          ],
        ),
      ),
    );
  }
   

    List<Person> persons = [
     Person(name: 'Suraj Patil', profileImg: 'images/avatar_boy.png', bio: "Software Developer"),
     Person(name: 'Rishab Pant', profileImg: 'images/avatar_boy.png', bio: "i'm good at coding"),
     Person(name: 'Sankalp Chordia', profileImg: 'images/avatar_boy.png', bio: "Software Tester at IBM")
  ];

   Widget personDetailCard(Person) {
     return Padding(
       padding: const EdgeInsets.all(10.0),
       child: Card(
         color: Colors.grey[800],
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(
             children: <Widget>[
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(
                     width: 50.0,
                     height: 50.0,
                     decoration: new BoxDecoration(
                         shape: BoxShape.circle,
                         image: new DecorationImage(
                             fit: BoxFit.cover,
                             image: AssetImage(Person.profileImg)
                         )
                     )),
               ),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Text(Person.name,
                     style: TextStyle (
                         color: Colors.white,
                         fontSize: 18
                     ),
                   ),
                   Text(Person.bio,
                     style: TextStyle (
                         color: Colors.white,
                         fontSize: 12
                     ),
                   )
                 ],
               )
             ],
           ),
         ),
       ),
     );
    }
  }