import 'package:flutter/material.dart';
import 'package:sdp_v2/pallaete.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sdp_v2/screens/account_screen.dart';
import 'login.dart';

// import 'signup.dart';
class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  final Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          color: Colors.green,
                          iconSize: 70,
                          onPressed: () {
                           Navigator.of(context)
                          .pushReplacementNamed(AccountScreen.routeName);
                          },
                        ),
                    ),
                  ),
                  const Flexible(
                    child: Center(
                      child: Text('Welcome Back',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 60,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  
                  Container(
                    padding: const EdgeInsets.fromLTRB(0,0,0,50,),
                    child: Text(
                      FirebaseAuth.instance.currentUser!.email.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
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
                ],
              ),
            );
          }
        ),
    );
  }
}
