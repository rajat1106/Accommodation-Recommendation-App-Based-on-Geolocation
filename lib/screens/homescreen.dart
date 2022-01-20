import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sdp_v2/page/profile_page.dart';
import 'package:sdp_v2/page/profile_page2.dart';
import 'package:sdp_v2/pallaete.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sdp_v2/screens/gender_roomate.dart';
import 'package:sdp_v2/screens/roomate_boys.dart';
import 'accomodation.dart';
import 'login.dart';

// import 'signup.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  final QuerySnapshot userRef;
 const HomeScreen({ required this.userRef});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    docsList=widget.userRef.docs.toList();
    print(docsList[0].data()['uid']);
    print(docsList);
    print(docsList[0].data()['City']);
    return Scaffold(
      backgroundColor: Colors.black45,
      body: FutureBuilder(
          future: _firebaseApp,
          builder: (context, snapshot) {
            return Center(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: const Icon(Icons.account_circle),
                        color: Colors.indigo[900],
                        iconSize: 70,
                        onPressed: () {
                         
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage2(userRef: docsList,)),
                          );
                        
                        },
                      ),
                    ),
                  ),
                  const Flexible(
                    child: Center(
                      child: Text(
                        'Welcome Back',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                    child: Column(
                    children:[
                  Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'images/girl.png',
                        height: 110,
                        width: 110,
                        fit: BoxFit.fitWidth,
                      )),
                      
                  const Flexible(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Text(
                        'What are you looking for?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                    ]))),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                          child: const Text('Logout',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              )),
                          onPressed: () async {
                            try {
                              await FirebaseAuth.instance
                                  .signOut()
                                  .then((value) {
                                Navigator.of(context).pushReplacementNamed(
                                    LoginScreen.routeName);
                              });
                            } catch (e) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(e.toString()),
                              ));
                            }
                          })),
                
                  Flexible(
                      // child: Align(
                      // alignment: Alignment.bottomCenter,
                      child: ElevatedButton(

                          child: const Text('Roomate',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              )),
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GenderPage()),
                            );
                          })
                      //),
                      ),
                  Flexible(
                     
                      child: ElevatedButton(
                          child: const Text('Accomodation',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              )),
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AccomPage()),
                            );
                          })
      
                      ),
                   
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset('images/skyline1.png')),
                ],
               
              ),
            );
          }),
    );
  }
}
