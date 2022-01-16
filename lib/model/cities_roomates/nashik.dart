import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdp_v2/page/profile_page.dart';
import 'package:sdp_v2/widget/appbar_widget.dart';

class Nashik1Page extends StatefulWidget {
  static const routeName = '/nashik';
  @override
  _Nashik1PageState createState() => _Nashik1PageState();
}

class _Nashik1PageState extends State<Nashik1Page> {
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();
    String? dropdownvalue = 'Mumbai';
    // List of items in our dropdown menu
    var items = [
      'Mumbai',
      'Pune',
      'Nashik',
      'New Delhi',
      'Bengaluru',
    ];
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
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
            ),
            Expanded(
              // added Expanded widget
              child: Row(
                children: [
                  Center(
                    child: Icon(
                      Icons.location_on_rounded,
                      size: 26,
                      color: Colors.indigo[900],
                    ),
                  ),
                  Center(
                    child: DropdownButton(
                      // Initial Value
                      value: dropdownvalue,
                      // Down Arrow Icon

                      icon: const Icon(Icons.keyboard_arrow_down),
                      style: TextStyle(
                          color: Colors.indigo[900],
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue;
                          if (dropdownvalue == 'Mumbai') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilePage()),
                            );
                          }
                        });
                      },
                    ),
                    
                  ),
                  const Center(
              child: Text(
                'This is mumbai',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
            ),
                ],
              ),
            ),
            Flexible(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset('images/skyline1.png')),
            ),
          ],
        ),
      ),
    );
  }
}