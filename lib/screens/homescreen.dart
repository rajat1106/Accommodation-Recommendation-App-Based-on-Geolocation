import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sdp_v2/page/profile_page.dart';
import 'package:sdp_v2/pallaete.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sdp_v2/screens/roomate.dart';
import 'accomodation.dart';
import 'login.dart';

// import 'signup.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  final Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: FutureBuilder(
          future: _firebaseApp,
          builder: (context, snapshot) {
            //           drawer: Drawer(
            //   child: ListView(
            //     padding: EdgeInsets.zero,
            //     children: const <Widget>[
            //       DrawerHeader(
            //         decoration: BoxDecoration(
            //           color: Colors.blue,
            //         ),
            //         child: Text(
            //           'Drawer Header',
            //           style: TextStyle(
            //             color: Colors.green,
            //             fontSize: 24,
            //           ),
            //         ),
            //       ),
            //       ListTile(
            //         leading: Icon(Icons.message),
            //         title: Text('Messages'),
            //       ),
            //       ListTile(
            //         leading: Icon(Icons.account_circle),
            //         title: Text('Profile'),
            //       ),
            //       ListTile(
            //         leading: Icon(Icons.settings),
            //         title: Text('Settings'),
            //       ),
            //     ],
            //   ),
            // );
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
                                builder: (context) => ProfilePage()),
                          );
                          // FirebaseFirestore.instance.collection('Users').get().then((value) => Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => ProfilePage(doc: value),
                          //     )));
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
                            fontSize: 60,
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
                  //   Flexible(
                  //   child: Center(
                  //   child: RichText(

                  //   text: TextSpan(
                  //     text: 'What are you ',
                  //     style: DefaultTextStyle.of(context).style,
                  //     color: Colors.white,
                  //     children: const <TextSpan>[
                  //       TextSpan(text: 'looking', style: TextStyle(fontWeight: FontWeight.bold)),
                  //       TextSpan(text: ' for?'),
                  //     ],
                  //   ),
                  // ),
                  // ),
                  // ),
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
                                  builder: (context) => RoomyPage()),
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
