import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login.dart';
import 'package:sdp_v2/pallaete.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignupScreen extends StatelessWidget {
  static const routeName = '/signup';

  Future<FirebaseApp> _firebaseApp =Firebase.initializeApp();
  TextEditingController email =  TextEditingController();
  TextEditingController password =  TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController city = TextEditingController();
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('Users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: FutureBuilder(
        future: _firebaseApp,
        builder: (context,snapshot) {
          return Center(
        child: Column(
          children: [
            Flexible(
              flex: 3,
              fit: FlexFit.loose,
                child: Center(
                  child: Text('Create an Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey[500]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                    ),
                    child:Center(
                      child: TextField(
                        controller: fullname,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                           prefixIcon: Padding(
                             padding: const EdgeInsets.symmetric(
                               horizontal: 20.0),
                             child: Icon(
                               Icons.tag_faces,
                               size: 26,
                               color: kMoon,
                              ),
                           ),
                         hintText: 'Name',
                         hintStyle: kBodyText,
                        ),
                        style: kBodyText,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                    ),
                    )
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey[500]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                    ),
                    child:Center(
                      child: TextField(
                        controller: city,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                           prefixIcon: Padding(
                             padding: EdgeInsets.symmetric(
                               horizontal: 20.0),
                             child: Icon(
                               Icons.account_balance ,
                               size: 26,
                               color: kMoon,
                              ),
                           ),
                         hintText: 'City',
                         hintStyle: kBodyText,
                        ),
                        style: kBodyText,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                    ),
                    )
                ),
              ),
            
            Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey[500]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                    ),
                    child:Center(
                      child: TextField(
                        controller: email,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                           prefixIcon: Padding(
                             padding: const EdgeInsets.symmetric(
                               horizontal: 20.0),
                             child: Icon(
                               Icons.alternate_email,
                               size: 26,
                               color: kMoon,
                              ),
                           ),
                         hintText: 'Email',
                         hintStyle: kBodyText,
                        ),
                        style: kBodyText,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                    ),
                    )
                ),
              ),

            Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey[500]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                    ),
                    child:Center(
                      child: TextField(
                        obscureText: true,
                        controller: password,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                           prefixIcon: Padding(
                             padding: const EdgeInsets.symmetric(
                               horizontal: 20.0),
                             child: Icon(
                               Icons.lock,
                               size: 26,
                               color: kMoon,
                              ),
                           ),
                         hintText: 'Password',
                         hintStyle: kBodyText,
                        ),
                        style: kBodyText,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                    ),
                    )
                ),
              ),
            

            Container(
              child: ElevatedButton(
                child: Text(
                  'Signup',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
              )
                  ),
                onPressed: () async{
                  if (email.text.isEmpty ||
                              password.text.isEmpty ||
                              fullname.text.isEmpty ||
                              city.text.isEmpty )
                  {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Please enter details'),
                    ));
                  }   
                  else{
                    try{
                      await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(email: email.text, password: password.text)
                      .then((value) async{
                        var firebaseUser = 
                                    FirebaseAuth.instance.currentUser;
                                await collectionReference
                                    .doc(firebaseUser!
                                        .uid) 
                                    .set({
                                  'email': email
                                      .text,
                                  'Name': fullname
                                      .text, 
                                  'City': city
                                  .text,
                                });
                        Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);});
                      
                    }catch(e){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(e.toString()),
                    ));
                    }
                    
                  }               
                }
                )
            ),
            SizedBox(
                      width: 20.0,
                      height: 20.0,
                    ),
            Container(
              padding: EdgeInsets.fromLTRB(20,20,20,20),
              child: TextButton(
                child: Text(
                  'Already have account?',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,)
                    ),
                onPressed: (){
                  Navigator.of(context)
                  .pushReplacementNamed(LoginScreen.routeName);
                }
                )
            ),
          ],
        ),
      );
        }
      ),
      
    );
  }
}