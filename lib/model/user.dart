import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class User1 {
  final Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();
  //final String imagePath;
  final String name= FirebaseAuth.instance.currentUser!.displayName.toString();
  final String email= FirebaseAuth.instance.currentUser!.email.toString();
  //final String about;

  // const User1({
  //   required this.imagePath,
  //   required this.name,
  //   required this.email,
  //   required this.about,
  // });
}