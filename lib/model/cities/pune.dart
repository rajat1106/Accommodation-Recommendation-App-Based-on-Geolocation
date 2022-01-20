import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:sdp_v2/page/profile_page2.dart';
import 'package:sdp_v2/widget/appbar_widget.dart';

class PunePage extends StatefulWidget {
  static const routeName = '/pune';
  @override
  _PunePageState createState() => _PunePageState();
}

class _PunePageState extends State<PunePage> {
   List docsList = [];
     var firebaseUser =
                                      FirebaseAuth.instance.currentUser;
                                      
  final CollectionReference ref =
      FirebaseFirestore.instance.collection('Users');
  Future<void> getData() async {
    QuerySnapshot querySnapshot = await ref.get();
    docsList = querySnapshot.docs.map((doc) => doc.data()).toList();
  }
  @override
  Widget build(BuildContext context) {
    
    // List of items in our dropdown menu
    
    return Scaffold(
      backgroundColor: Colors.black45,
      body: const MyStatelessWidget(),
    );
  }
}

class _ArticleDescription extends StatelessWidget {
  
  const _ArticleDescription({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.author,
    required this.publishDate,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              
              Expanded(
                  child: Row(
                children: [
                  Text(
                author,
                style: const TextStyle(
                  fontSize: 22.0,
                  color: Colors.blueAccent,
                ),
              ),
                  IconButton(
                    onPressed: () => MapsLauncher.launchCoordinates(
                        18.597176560200886, 74.0724340797522),
                    icon: Icon(Icons.directions),
                    color: Colors.blue,
                  )
                ],
              )),
              Text(
                    '$publishDate',
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.blueGrey,
                    ),
                  ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomListItemTwo extends StatelessWidget {
  
  const CustomListItemTwo({
    Key? key,
    required this.thumbnail,
    required this.title,
    required this.subtitle,
    required this.author,
    required this.publishDate,
  }) : super(key: key);

  final Widget thumbnail;
  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.0,
              child: thumbnail,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                child: _ArticleDescription(
                  title: title,
                  subtitle: subtitle,
                  author: author,
                  publishDate: publishDate,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10.0),
      children: <Widget>[
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: const Icon(Icons.account_circle),
            color: Colors.indigo[900],
            iconSize: 70,
            onPressed: () {
              var docsList;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage2(userRef: docsList,)),
              );
            },
          ),
        ),
        Align(alignment: Alignment.topLeft,
        child:Text('Pune',style:TextStyle(  
              fontSize: 10,  
              color: Colors.blue,  
              fontStyle: FontStyle.normal, 
              shadows: [  
                Shadow(color: Colors.blueAccent, offset: Offset(2,1), blurRadius:10)  
              ]  
            ),  )
        ),
        Expanded(child: Row(
          children: [
            Text(  
            "Accomodation for: ",  
            style: TextStyle(  
              fontSize: 20,  
              color: Colors.white,  
              fontStyle: FontStyle.normal, 
              shadows: [  
                Shadow(color: Colors.blueAccent, offset: Offset(2,1), blurRadius:10)  
              ]  
            ),  
          ),  SizedBox(width: 5,),
            TextButton.icon(
              style: TextButton.styleFrom(
                textStyle: TextStyle(color: Colors.white),
                backgroundColor: Colors.blueAccent,
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ), 
              ),
              onPressed:() {},
              icon: Icon(Icons.male_outlined),
              label: Text('Boys',),
        ),
        SizedBox(width: 5,),
            TextButton.icon(
              style: TextButton.styleFrom(
                textStyle: TextStyle(color: Colors.white),
                backgroundColor: Colors.pink,
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ), 
              ),
              onPressed: (){// Get the height you want to scroll to. 
              },
              icon: Icon(Icons.female),
              label: Text('Girls',),
        ),
          ],
        )
        ),
        Divider(
          color: Colors.white,
        ),
        Container(
      height: 350.0,
      width: 200.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'images/pune_boys.png'),
          
        ),
        shape: BoxShape.rectangle,
      ),
    ),
         Divider(
          color: Colors.white,
        ),
        CustomListItemTwo(
          thumbnail: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/pune_icon.webp'),
                  fit: BoxFit.fill,
                ),
                color: Colors.blue),
          ),
          title: 'Jaihind Boys Hostel',
          subtitle: 'Mess avaiable',
          author: 'Open',
          publishDate: 'for boys',
        ),
        Divider(
          color: Colors.white,
        ),
        CustomListItemTwo(
          thumbnail: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/pune_icon.webp'),
                  fit: BoxFit.fill,
                ),
                color: Colors.blue),
          ),
          title: 'Shrinivas Boys Hostel',
          subtitle: 'Mess avaiable',
          author: 'Open',
          publishDate: 'for boys',
        ),
        Divider(
          color: Colors.white,
        ),
        CustomListItemTwo(
          thumbnail: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/pune_icon.webp'),
                  fit: BoxFit.fill,
                ),
                color: Colors.blue),
          ),
          title: 'Shanti Heights Boys Hostel',
          subtitle: 'Mess avaiable',
          author: 'Tempriorly Close',
          publishDate: 'for boys',
        ),
        Divider(
          color: Colors.white,
        ),
        CustomListItemTwo(
          thumbnail: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/pune_icon.webp'),
                  fit: BoxFit.fill,
                ),
                color: Colors.blue),
          ),
          title: 'Vastudeep Hostel ',
          subtitle: 'Mess avaiable',
          author: 'Open',
          publishDate: 'for boys',
        ),
        Divider(
          color: Colors.white,
        ),
        CustomListItemTwo(
          thumbnail: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/pune_icon.webp'),
                  fit: BoxFit.fill,
                ),
                color: Colors.blue),
          ),
          title: 'SR Wagh Boys Hostel',
          subtitle: 'Mess avaiable',
          author: 'Open',
          publishDate: 'for boys',
        ),
        Divider(
          color: Colors.white,
        ),
        CustomListItemTwo(
          thumbnail: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/pune_icon.webp'),
                  fit: BoxFit.fill,
                ),
                color: Colors.blue),
          ),
          title: 'Mitra Boys Hostel',
          subtitle: 'Mess avaiable',
          author: 'Open',
          publishDate: 'for boys',
        ),
        Divider(
          color: Colors.white,
        ),
        CustomListItemTwo(
          thumbnail: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/pune_icon.webp'),
                  fit: BoxFit.fill,
                ),
                color: Colors.blue),
          ),
          title: 'Tanishq Park Boys Hostel',
          subtitle: 'Mess avaiable',
          author: 'Open',
          publishDate: 'for boys',
        ),
        Divider(
          color: Colors.white,
        ),
        CustomListItemTwo(
          thumbnail: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/pune_icon.webp'),
                  fit: BoxFit.fill,
                ),
                color: Colors.blue),
          ),
          title: 'Krushna Kunj Boys Hostel',
          subtitle: 'Mess avaiable',
          author: 'Open',
          publishDate: 'for boys',
        ),
       Divider(
          color: Colors.white,
        ),
        Container(
      height: 350.0,
      width: 200.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'images/pune_girls.png'),
          
        ),
        shape: BoxShape.rectangle,
      ),
    ),
         Divider(
          color: Colors.white,
        ),
        CustomListItemTwo(
          thumbnail: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/pune_icon.webp'),
                  fit: BoxFit.fill,
                ),
                color: Colors.pink),
          ),
          title: 'Pramila Girls Hostel',
          subtitle: 'Mess avaiable',
          author: 'Open',
          publishDate: 'for girls',
        ),
        Divider(
          color: Colors.white,
        ),
       CustomListItemTwo(
          thumbnail: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/pune_icon.webp'),
                  fit: BoxFit.fill,
                ),
                color: Colors.pink),
          ),
          title: 'Kaushalya Girls Hostel',
          subtitle: 'Mess avaiable',
          author: 'Open',
          publishDate: 'for girls',
        ),
        Divider(
          color: Colors.white,
        ),
       CustomListItemTwo(
          thumbnail: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/pune_icon.webp'),
                  fit: BoxFit.fill,
                ),
                color: Colors.pink),
          ),
          title: 'Apna Ghar PG for Girls',
          subtitle: 'Mess avaiable',
          author: 'Open',
          publishDate: 'for girls',
        ),
        Divider(
          color: Colors.white,
        ),
       CustomListItemTwo(
          thumbnail: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/pune_icon.webp'),
                  fit: BoxFit.fill,
                ),
                color: Colors.pink),
          ),
          title: 'Saee Youth Castle Girls Hostel',
          subtitle: 'Mess avaiable',
          author: 'Open',
          publishDate: 'for girls',
        ),
        Divider(
          color: Colors.white,
        ),
       CustomListItemTwo(
          thumbnail: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/pune_icon.webp'),
                  fit: BoxFit.fill,
                ),
                color: Colors.pink),
          ),
          title: 'META Girls Hostel',
          subtitle: 'Mess avaiable',
          author: 'Open',
          publishDate: 'for girls',
        ),
        Divider(
          color: Colors.white,
        ),
       CustomListItemTwo(
          thumbnail: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/pune_icon.webp'),
                  fit: BoxFit.fill,
                ),
                color: Colors.pink),
          ),
          title: 'Tapswi Girls Hostel',
          subtitle: 'Mess avaiable',
          author: 'Open',
          publishDate: 'for girls',
        ),
        Divider(
          color: Colors.white,
        ),
       CustomListItemTwo(
          thumbnail: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/pune_icon.webp'),
                  fit: BoxFit.fill,
                ),
                color: Colors.pink),
          ),
          title: 'Scholars Inn Girls Hostel',
          subtitle: 'Mess avaiable',
          author: 'Open',
          publishDate: 'for girls',
        ),
        Divider(
          color: Colors.white,
        ),
        CustomListItemTwo(
          thumbnail: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/pune_icon.webp'),
                  fit: BoxFit.fill,
                ),
                color: Colors.pink),
          ),
          title: 'Arihant Girls Hostel PG',
          subtitle: 'Mess avaiable',
          author: 'Open',
          publishDate: 'for girls',
        ),
        Divider(
          color: Colors.white,
        ),
       

      ],
    );
  }
}