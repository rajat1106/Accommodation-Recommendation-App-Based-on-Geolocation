import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sdp_v2/model/user.dart';
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

class ProfilePage extends StatefulWidget {
  // final QuerySnapshot doc;
  const ProfilePage({Key? key}) : super(key: key);
  static const routeName = '/account';
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController _userbio;
  void updateBio(str) {
    FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      "Bio": str,
    });
  }

  //QueryDocumentSnapshot d=FirebaseFirestore.instance.widget.doc.doc(FirebaseAuth.instance.currentUser!.uid).get();
  var x;
  @override
  void initState() {
     var d;
    getuser() async {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((value) => d = value);
      print(d);}
    final Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();
    getuser();
   _userbio = TextEditingController(text: d.get('Bio'));
  }
  late bool switchListTileValue;
  @override
  Widget build(BuildContext context) {
//     update() async {
//     await widget.doc.update({
//       'Bio': _userbio.text,
//     });
// }
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
            decoration: BoxDecoration(color: Colors.teal),
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Column(
              children: [
                Stack(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage:
                          // (_userProfile != null)
                          //     ? Image.network(_userProfile)
                          //     :
                          AssetImage("img/p.png"),
                      radius: 70.0,
                    ),
                    Positioned(
                        bottom: 10,
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
              " 📧 : ", //$_userEmail,
              style: TextStyle(fontSize: 17),
            ),
          ),
          ListTile(
            title: Text(
              " 👤 : ", //$_userName",
              style: TextStyle(fontSize: 17),
            ),
          ),
          ListTile(
            title: Text(
              " 🏡 : ", //$_userCity",
              style: TextStyle(fontSize: 17),
            ),
          ),
          TextField(
            controller: _userbio,
            decoration: InputDecoration(
              prefixText: 'Bio',
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: Colors.grey[800],
              contentPadding: EdgeInsets.all(10),
              border: InputBorder.none,
            ),
          ),
          const SizedBox(height: 48),
          Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                  child: const Text('Update',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      )),
                  onPressed: () async {
                    updateBio(_userbio.value);
                  })),
          ElevatedButton(onPressed: null, child: Text('Submit')),
          Container(
            padding: const EdgeInsets.fromLTRB(
              0,
              20,
              50,
              20,
            ),
            child: Text(
              FirebaseAuth.instance.currentUser!.email.toString(),
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          const SizedBox(height: 24),
          Flexible(
            child: Align(
              // alignment: Alignment.bottomCenter,
              child: ToggleSwitch(
                minWidth: 90.0,
                cornerRadius: 20.0,
                activeBgColors: [
                  [Colors.cyan],
                  [Colors.redAccent]
                ],
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.white,
                totalSwitches: 2,
                labels: ['YES', ''],
                icons: [null, FontAwesomeIcons.times],
                onToggle: (index) {
                  print('switched to: $index');
                },
              ),
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
                   SwitchListTile(
              value: switchListTileValue ??= true,
              onChanged: (newValue) =>
                  setState(() => switchListTileValue = newValue),
              title: Text(
                'Enable for Roomate',     
              ),
              subtitle: Text(
                'looking for a roomate',
              ),
              tileColor: Color(0xFFF5F5F5),
              dense: false,
              controlAffinity: ListTileControlAffinity.trailing,
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

uploadImage() {}



// var _userName = "";
//   var _userEmail = "";
//   var _userCity = "";
//   // String _userProfile = "";

//   Future<void> _getUD() async {
//     FirebaseFirestore.instance
//         .collection('Uu')
//         .doc((FirebaseAuth.instance.currentUser!.uid))
//         .get()
//         .then((value) {
//       setState(() {
//         _userName = value.data()!['Name'];
//         _userEmail = value.data()!['email'];
//         _userCity = value.data()!['City'];
//         // _userProfile = value.data()['url'];
//       });
//     });
//   }

//   void initState() {
//     super.initState();
//     _getUD();
//   }

//   uploadImage() async {
//     final _storage = FirebaseStorage.instance;
//     final _picker = ImagePicker();
//     PickedFile image;
//     if (PermissionStatus.granted != null) {
//       image = await _picker.getImage(source: ImageSource.gallery);
//       var file = File(image.path);
//       if (image != null) {
//         var snapshot = await _storage.ref().child(_userName).putFile(file);
//         if (_userName != null) {
//           var snapshot = await _storage.ref().child(_userName).putFile(file);
//           var downloadurl = await snapshot.ref.getDownloadURL();
//           var fuu = FirebaseAuth.instance.currentUser;
//           u.doc(fuu.uid).set({
//             'url': downloadurl,
//           });

//           setState(() {
//             imurl = downloadurl;
//             f = file;
//           });
//         } else {
//           print("No path received");
//         }
//       } else {
//         print("Grant permissions and try again");
//       }
//     }
//   }
// }
