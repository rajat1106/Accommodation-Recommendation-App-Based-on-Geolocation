import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserInformation extends StatefulWidget {
  static const routeName = '/UserInformation';
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final firestoreInstance = FirebaseFirestore.instance; //FireStore instance
  bool retrival = false;
  String name = "";
  String email = "";
  String city = "";
  String bio = "";

  var firebaseUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Information'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                var firebaseUser = FirebaseAuth.instance
                    .currentUser; //Getting the info about the current user.
                firestoreInstance
                    .collection("Users")
                    .doc(firebaseUser?.uid)
                    .get() //get method is used to get the data of the particular document of the unique id which matches with the current user.
                    .then((value) {
                  name = value.data()!['Name'];
                  email = value.data()!['email'];
                  city = value.data()!['City'];
                  bio = value.data()!['Bio'];
                  setState(() {
                    retrival = true;
                    
                  });
                });
              },
              child: const Text('Retrive'),
            ),

            //Just Printing out the User Details with the help of ListTile Widget
            Container(
              height: 400.0,
              width: MediaQuery.of(context).size.width / 1.7,
              child: Column(
                children: [
                  ListTile(
                    title: Text(retrival ? name : " "),
                    subtitle: Text('Name'),
                  ),
                  ListTile(
                      title: Text(retrival ? city : " "),
                      subtitle: Text('City')),
                  ListTile(
                      title: Text(retrival ? email : " "),
                      subtitle: Text('Email'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
