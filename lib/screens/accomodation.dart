import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdp_v2/widget/appbar_widget.dart';

class AccomPage extends StatefulWidget {
  static const routeName = '/accomodation';
  @override
  _AccomPageState createState() => _AccomPageState();
}

class _AccomPageState extends State<AccomPage> {
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();

    return Scaffold(
      body:(
      const Flexible(
                    child: Center(
                      child: Text('Accomodation',
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