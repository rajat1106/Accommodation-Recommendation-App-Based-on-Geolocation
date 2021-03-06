import 'package:sdp_v2/pallaete.dart';
import 'package:sdp_v2/screens/accomodation.dart';
import 'package:sdp_v2/screens/roomate_boys.dart';
import 'package:sdp_v2/screens/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:sdp_v2/screens/user_details.dart';
import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/signup.dart';
import 'screens/homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Palette.kToDark,
      ),
      home: SplashScreen(),
      routes: {
        
        SignupScreen.routeName: (ctx) => SignupScreen(),
        LoginScreen.routeName: (ctx) => LoginScreen(),
        //HomeScreen.routeName: (ctx) => HomeScreen(),
        //ProfilePage2.routeName: (ctx) => ProfilePage(),
        UserInformation.routeName: (ctx) => UserInformation(),
        RoomyPage.routeName: (ctx) => RoomyPage(),
        AccomPage.routeName: (ctx) => AccomPage(),
      },
    );
  }
}



