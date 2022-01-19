import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdp_v2/page/profile_page.dart';
import 'package:sdp_v2/widget/appbar_widget.dart';

class Delhi2Page extends StatefulWidget {
  static const routeName = '/delhi';
  @override
  _Delhi2PageState createState() => _Delhi2PageState();
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

class _Delhi2PageState extends State<Delhi2Page> {
  @override
  final Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();
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
     Person(name: 'Anagha Patil', profileImg: 'img/avatar_boy.png', bio: "Student at DU"),
     Person(name: 'Ananya Pandey', profileImg: 'img/pic-2.png', bio: "Instagram Influcncer"),
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