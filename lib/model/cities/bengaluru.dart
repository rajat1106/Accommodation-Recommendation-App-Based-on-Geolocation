import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:sdp_v2/page/profile_page2.dart';
import 'package:sdp_v2/page/profile_page2.dart';
import 'package:sdp_v2/widget/appbar_widget.dart';

class BangPage extends StatefulWidget {
  static const routeName = '/bengaluru';
  @override
  _BangPageState createState() => _BangPageState();
}

class _BangPageState extends State<BangPage> {
  @override
  Widget build(BuildContext context) {
    
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
                        12.990052971069892, 77.62685922034734),
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
  CustomListItemTwo({
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
        child:Text('Bengaluru',style:TextStyle(  
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
              onPressed: (){final screenHeight = MediaQuery.of(context).size.height;},
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
              final screenHeight = MediaQuery.of(context).size.height*0.5;},
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
              'images/bengaluru_boys.png'),
          
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
                  image: AssetImage('images/banglluru_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.blue),
          ),
          title: 'Shaheens Falcon Residential for Boys',
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
                  image: AssetImage('images/banglluru_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.blue),
          ),
          title: 'BGS Hostel For Boys',
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
                  image: AssetImage('images/banglluru_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.blue),
          ),
          title: 'Manjunath Boys PG',
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
                  image: AssetImage('images/banglluru_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.blue),
          ),
          title: 'Srinivas Luxury Pg for men/Boys',
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
                  image: AssetImage('images/banglluru_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.blue),
          ),
          title: 'LVR PG for Boys',
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
                  image: AssetImage('images/banglluru_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.blue),
          ),
          title: 'SLV Boys PG',
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
                  image: AssetImage('images/banglluru_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.blue),
          ),
          title: 'Benaka Boys Hostel',
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
                  image: AssetImage('images/banglluru_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.blue),
          ),
          title: 'Venkatamma Boys Hostel',
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
              'images/bengaluru_girls.png'),
          
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
                  image: AssetImage('images/banglluru_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.pink),
          ),
          title: 'Student Ladies Hostel',
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
                  image: AssetImage('images/banglluru_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.pink),
          ),
          title: 'Nidhi nest Girls PG',
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
                  image: AssetImage('images/banglluru_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.pink),
          ),
          title: 'PURA Girls PG',
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
                  image: AssetImage('images/banglluru_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.pink),
          ),
          title: 'Ursuline Hostel For Girls',
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
                  image: AssetImage('images/banglluru_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.pink),
          ),
          title: 'Ramu PG for Ladies',
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
                  image: AssetImage('images/banglluru_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.pink),
          ),
          title: 'Adler Stays luxury PG for Girls',
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
                  image: AssetImage('images/banglluru_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.pink),
          ),
          title: 'Augustine Girls Hostel',
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
                  image: AssetImage('images/banglluru_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.pink),
          ),
          title: 'Sunshine PG for Girls',
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