import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdp_v2/page/profile_page.dart';
import 'package:sdp_v2/widget/appbar_widget.dart';

class NashikPage extends StatefulWidget {
  static const routeName = '/nashik';
  @override
  _NashikPageState createState() => _NashikPageState();
}

class _NashikPageState extends State<NashikPage> {
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();
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
                    onPressed: () {},
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ),
        Align(alignment: Alignment.topLeft,
        child:Text('Nashik',style:TextStyle(  
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
        CustomListItemTwo(
          thumbnail: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/nashik_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.blue),
          ),
          title: 'Golden Jubilee Boys Hostel ',
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
                  image: AssetImage('images/nashik_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.blue),
          ),
          title: 'Kurhade boys hostel ',
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
                  image: AssetImage('images/nashik_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.blue),
          ),
          title: 'Sanket Boys Hostel',
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
                  image: AssetImage('images/nashik_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.blue),
          ),
          title: 'Kanse Boys Hostel ',
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
                  image: AssetImage('images/nashik_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.blue),
          ),
          title: 'Studious Hostel',
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
                  image: AssetImage('images/nashik_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.blue),
          ),
          title: 'Manas Boys Hostel',
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
                  image: AssetImage('images/nashik_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.blue),
          ),
          title: 'Kusumai Sankul Cot Basis For Boys',
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
                  image: AssetImage('images/nashik_icon.png'),
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
        CustomListItemTwo(
          thumbnail: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/nashik_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.pink),
          ),
          title: 'Naik House - Girls Hostel',
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
                  image: AssetImage('images/nashik_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.pink),
          ),
          title: 'Sawali Girls Hostel',
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
                  image: AssetImage('images/nashik_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.pink),
          ),
          title: 'Tulip Girls Hostel and PG',
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
                  image: AssetImage('images/nashik_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.pink),
          ),
          title: 'Metrocity Girls Hostel',
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
                  image: AssetImage('images/nashik_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.pink),
          ),
          title: 'Her Highness Homes (Girls Hostel & PG)',
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
                  image: AssetImage('images/nashik_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.pink),
          ),
          title: 'Pegasus Girls Hostel',
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
                  image: AssetImage('images/nashik_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.pink),
          ),
          title: 'Deccan Hostel',
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
                  image: AssetImage('images/nashik_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.pink),
          ),
          title: 'Four Seasons Girls Hostel',
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