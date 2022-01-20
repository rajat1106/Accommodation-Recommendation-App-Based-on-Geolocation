  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:sdp_v2/pallaete.dart';
import 'package:sdp_v2/screens/login.dart';
import 'package:sdp_v2/utils/user_preferences.dart';
import 'package:sdp_v2/widget/appbar_widget.dart';
import 'package:sdp_v2/widget/button_widget.dart';
import 'package:sdp_v2/widget/profile_widget.dart';
import 'package:sdp_v2/screens/user_details.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../pallaete.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage2 extends StatefulWidget {
  static const routeName = '/account';
  var userRef;
  ProfilePage2({ required this.userRef});
  @override
  _ProfilePage2State createState() => _ProfilePage2State();
}

class _ProfilePage2State extends State<ProfilePage2> {
   List docsList = [];
    var firebaseUser = FirebaseAuth.instance.currentUser;    
    final Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();                           
  final CollectionReference ref = FirebaseFirestore.instance.collection('Users');
  Future<void> getData() async {
    QuerySnapshot querySnapshot = await ref.get();
    docsList = querySnapshot.docs.map((doc) => doc.data()).toList();
  }
  getValue(){
    for (var i = 0; i < docsList.length; i++) {
      if(docsList[i].data()['uid'].toString()==firebaseUser?.uid.toString())
      {  
      }
    }
  }

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    getValue();
  }


  @override
  Widget build(BuildContext context) {
  final Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();
    //docsList=widget.userRef.docs.toList();
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Colors.black54,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 24),
          Container(
            decoration: BoxDecoration(color: Colors.teal),
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Column(
              children: [
                Stack(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage:
                          AssetImage("images/avatar_boy.png"),
                      radius: 71.0,
                    ),
                    Positioned(
                        bottom: 5,
                        right: 12,
                        child: IconButton(
                          color: Colors.white60,
                          onPressed: () => uploadImage(),
                          icon: Icon(Icons.camera_alt_rounded),
                          iconSize: 25,
                        ))
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              " 📧 : ${FirebaseAuth.instance.currentUser!.email.toString()}",
              style: TextStyle(fontSize: 17, color: Colors.white,fontWeight: FontWeight.bold,),
            ),
          ),
          ListTile(
            title: Text(
              " 👤 : Rajat Harne ",//${widget.userRef[0].data()['Name']}",//${FirebaseAuth.instance.currentUser!.displayName.toString()}",
              style: TextStyle(fontSize: 17, color: Colors.white,fontWeight: FontWeight.bold,),
            ),
          ),
          ListTile(
            title: Text(
              " 🏡 : Pune ",//${widget.userRef[0].data()['City']}",
              style: TextStyle(fontSize: 17, color: Colors.white,fontWeight: FontWeight.bold,),
            ),
          ),
          TextField(
            //controller: _userbio,
            decoration: InputDecoration( 
              prefixIcon: Icon(Icons.speaker_notes_outlined ),
              labelText: "Write About Yourself...",
              labelStyle: TextStyle(
                  color: Colors.white,
              ),
              prefixText: 'Bio',
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                 borderSide: const BorderSide(color: Colors.white60,),),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.blueAccent),
              ),
              filled: true,
              fillColor: Colors.grey[800],
              contentPadding: EdgeInsets.all(10),
              border: InputBorder.none,
            ),
          ),
          const SizedBox(height: 10),
          Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                  child: const Text('Update',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      )),
                  onPressed: () async {
                    //updateBio(_userbio.value);
                  })),
          const SizedBox(height: 34),
          Flexible(
            child: Row(
              // alignment: Alignment.bottomCenter,
              children: [
                Text(
                'Enable for Roommate:',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
               SizedBox(width: 20,),
                ToggleSwitch(
                minWidth: 80.0,
                cornerRadius: 20.0,
                activeBgColors: [
                  [Colors.cyan],
                  [Colors.redAccent]
                ],
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.white,
                totalSwitches: 2,
                labels: ['YES', 'NO'],
                icons: [null, FontAwesomeIcons.times],
                onToggle: (index) {
                  print('switched to: $index');
                  
                },
              ),
              ]
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
                      )),
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance.signOut().then((value) {
                        Navigator.of(context)
                            .pushReplacementNamed(LoginScreen.routeName);
                      });
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(e.toString()),
                      ));
                    }
                  })),

                  
            //        SwitchListTile(
            //   value: switchListTileValue,
            //   onChanged: (newValue) =>
            //       setState(() => switchListTileValue = newValue),
            //   title: Text(
            //     'Enable for Roomate',     
            //   ),
            //   subtitle: Text(
            //     'looking for a roomate',
            //   ),
            //   tileColor: Color(0xFFF5F5F5),
            //   dense: false,
            //   controlAffinity: ListTileControlAffinity.trailing,
            // ), 
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

uploadImage() {
}