import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdp_v2/model/user.dart';
import 'package:sdp_v2/screens/login.dart';
import 'package:sdp_v2/utils/user_preferences.dart';
import 'package:sdp_v2/widget/appbar_widget.dart';
import 'package:sdp_v2/widget/button_widget.dart';
import 'package:sdp_v2/widget/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = '/account';
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();

    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Colors.black,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          // ProfileWidget(
          //   imagePath: user.imagePath,
          //   onClicked: () async {},
          // ),
          // Container(
          //           padding: const EdgeInsets.fromLTRB(0,0,0,50,),
          //           child: Text(
          //             FirebaseAuth.instance.currentUser!.displayName.toString(),
          //             style: const TextStyle(
          //               fontSize: 20,
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //         ),
          const SizedBox(height: 24),
          Container(
                    padding: const EdgeInsets.fromLTRB(0,0,0,50,),
                    child: Text(
                      FirebaseAuth.instance.currentUser!.email.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  ),
          const SizedBox(height: 24),
          Flexible(
            child: Align(
            // alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                child: const Text('Enable for roomate',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                )
              ),
                onPressed: () async {
                }
                )
            ),
          ),
          const SizedBox(height: 48),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
            child: const Text('Logout',
            style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
              )
            ),
            onPressed: () async {
              try {
                await FirebaseAuth.instance
               .signOut()
                .then((value) {
             Navigator.of(context).pushReplacementNamed(
                  LoginScreen.routeName);
                  }
                );
                } catch (e) {
                  ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(
                    content: Text(e.toString()),
                                 )
                              );
                            }
                          }
              )
            ), 
        ],
      ),
    );
  }

  // Widget buildName(User1 user) => Column(
  //       children: [
  //         Text(
  //           user.name,
  //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
  //         ),
  //         const SizedBox(height: 4),
  //         Text(
  //           user.email,
  //           style: TextStyle(color: Colors.grey),
  //         )
  //       ],
  //     );

  // Widget buildAbout(User1 user) => Container(
  //       padding: EdgeInsets.symmetric(horizontal: 48),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             'About',
  //             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  //           ),
  //           const SizedBox(height: 16),
  //           // Text(
  //           //   user.about,
  //           //   style: TextStyle(fontSize: 16, height: 1.4),
  //           // ),
  //         ],
  //       ),
  //     );

}