import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdp_v2/page/profile_page.dart';
import 'package:sdp_v2/screens/roomate-girls.dart';
import 'package:sdp_v2/screens/roomate_boys.dart';
import 'package:sdp_v2/widget/appbar_widget.dart';

class GenderPage extends StatefulWidget {
  static const routeName = '/gender';
  @override
  _GenderPageState createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon:
                      Icon(Icons.arrow_back, size: 35, color: Colors.blue[900]),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Text(
                  'Roomates',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                IconButton(
                  icon: const Icon(Icons.account_circle),
                  color: Colors.indigo[900],
                  iconSize: 70,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                ),
              ],
              
            ),
             SizedBox(height: 100,),
        Align(
         alignment: FractionalOffset(0.2, 0.6),
                    child: Center(
                      child: Text(
                        'Rommates for ?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
        ),
    SizedBox(height: 50,),
           Row(
           children:[
             SizedBox(width: 10,),
           Center(
              child:  Material(
              color: Colors.blueAccent,
              elevation: 8,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                splashColor: Colors.black45,
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RoomyPage()),
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                children:[
                  Ink.image(
                  image: const AssetImage('images/gender_boys.jpg'),
                  height: 200,
                  width: 150,
                  fit: BoxFit.cover,
                ),
                SizedBox(height:6),
                Text(
                  'For Boys',
                  style: TextStyle(fontSize: 32, color: Colors.white,)
                  
                ),
                SizedBox(height: 6),
                ]
              )
              ),
           ),
           ),
           SizedBox(width: 20,),
           Center(
              child:  Material(
              color: Colors.blueAccent,
              elevation: 8,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                splashColor: Colors.black45,
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Roomy2Page()),
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                children:[
                  Ink.image(
                  image: const AssetImage('images/gender_girls.jpg'),
                  height: 200,
                  width: 150,
                  fit: BoxFit.cover,
                ),
                SizedBox(height:6),
                Text(
                  'For Girls',
                  style: TextStyle(fontSize: 32, color: Colors.white)
                ),
                SizedBox(height: 6),
                ]
              )
              ),
           ),
           
           ),
          ]
        )
           ],
         
        ),
      ),
    );
  }
}
