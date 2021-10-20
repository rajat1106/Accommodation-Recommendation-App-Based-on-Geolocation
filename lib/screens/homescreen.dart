import 'package:flutter/material.dart';
import 'package:sdp_v2/pallaete.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
            drawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: const <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Drawer Header',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.message),
          title: Text('Messages'),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Profile'),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
        ),
      ],
    ),
  );
            return Center(
              child: Column(
                children: [
                  const Flexible(
                    flex: 3,
                    child: Center(
                      child: Icon(
                        Icons.account_circle ,
                        size: 100,
                        color: kGreen,
                      ),
                    ),
                    fit: FlexFit.loose,
                  ),
                  const Flexible(
                    child: Center(
                      child: Text('Welcome Back',
                        style: TextStyle(
                          color: Colors.white,
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
                    padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                    child: const Text(
                      '😎😎',
                      style: TextStyle(
                        fontSize: 35,
                        // fontWeight: FontWeight.bold,
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
