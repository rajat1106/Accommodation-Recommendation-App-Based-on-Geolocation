import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sdp_v2/pallaete.dart';
import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'signup.dart';

class LoginScreen extends StatelessWidget{

  static const routeName = '/login';
  final Future<FirebaseApp>_firebaseApp = Firebase.initializeApp();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.black45,
          body:Column(
            children:[	
              Image.asset(
                  'images/splash.png',
                  scale: 2
              ),
              const Flexible(
                flex: 6,
                child: Center(
                  child: Text('Welcome Back',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                fit: FlexFit.tight,
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
                    child: Center(
                      child: TextField(
                        controller: email,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                           prefixIcon: Padding(
                             padding: EdgeInsets.symmetric(
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
                    child: Center(
                      child: TextField(
                        obscureText: true,
                        controller: password,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                           prefixIcon: Padding(
                             padding: EdgeInsets.symmetric(
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
                  child: const Text('Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    )
                  ),
                  onPressed: () async {
                    if (email.text.isEmpty || password.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter valid credentials'),
                        )
                      );
                    } 
                    else {
                            try {
                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: email.text,
                                      password: password.text,
                                    )
                                  .then((value) {
                                Navigator.of(context)
                                    .pushReplacementNamed(HomeScreen.routeName);
                              });
                            } 
                            catch (e) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(e.toString()),
                              ));
                            }
                          }
                  }
                ),
              ),
                    const SizedBox(
                      width: 20.0,
                      height: 20.0,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20,20,20,20),
                      child: TextButton(
                        child: const Text(
                          'Create an account?',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,)
                            ),
                            onPressed: (){
                              Navigator.of(context)
                              .pushReplacementNamed(SignupScreen.routeName);
                            }
                      )
                    ),
            ],
          ),
        )

      ],//children
    );
  }//Widget build
} //class  Login