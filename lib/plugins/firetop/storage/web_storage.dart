// import 'package:firebase/firebase.dart';
// import 'package:flutter/material.dart';

// class FireStorageService extends ChangeNotifier {
//   FireStorageService._();

//   FireStorageService() {
//     initializeApp(
//         apiKey: "AIzaSyDEktNdn4CsMUxeOyVkPFBnaoAdNhcpEPc",
//         authDomain: "fir-recipes-b5611.firebaseapp.com",
//         databaseURL: "https://fir-recipes-b5611.firebaseio.com",
//         projectId: "sdpv2-c7983",
//         storageBucket: "sdpv2-c7983.appspot.com",);
//   }

//   static Future<dynamic> loadFromStorage(
//       BuildContext context, String image) async {
//     var url = await storage().ref(image).getDownloadURL();
//     return url;
//   }
// }