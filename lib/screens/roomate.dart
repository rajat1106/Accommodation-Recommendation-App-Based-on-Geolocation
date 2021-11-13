import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdp_v2/widget/appbar_widget.dart';

class RoomyPage extends StatefulWidget {
  static const routeName = '/rommate';
  @override
  _RoomyPageState createState() => _RoomyPageState();
}

class _RoomyPageState extends State<RoomyPage> {
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();

    return Scaffold(
      body:(
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
                  )
                ),
                );
            }
        }