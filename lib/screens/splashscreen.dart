import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sdp_v2/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'homescreen.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),() {if(FirebaseAuth.instance.currentUser != null){
          Navigator.pushReplacementNamed(context, '/home');
          }
      else{
        Navigator.pushReplacementNamed(context, '/login');
      };
    }  
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/splash.png',
              width: 600,
              height: 400,
            ),
            SizedBox(
              height: 20,
            ),
            // CircularProgressIndicator(
            //   valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
            //   backgroundColor: Colors.red,
            //   strokeWidth: 10,
            // ),

            SizedBox(height: 20,),

            LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
              backgroundColor: Colors.indigo[900],
              minHeight: 5,
            )
          ],
        ),
      ),
    );
  }
}