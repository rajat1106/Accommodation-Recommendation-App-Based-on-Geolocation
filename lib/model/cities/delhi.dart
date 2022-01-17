import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdp_v2/page/profile_page.dart';
import 'package:sdp_v2/widget/appbar_widget.dart';

class DelhiPage extends StatefulWidget {
  static const routeName = '/delhi';
  @override
  _DelhiPageState createState() => _DelhiPageState();
}

class _DelhiPageState extends State<DelhiPage> {
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ),
        Align(alignment: Alignment.topLeft,
        child:Text('New Delhi',style:TextStyle(  
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
              'images/delhi_boys.png'),
          
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
                  image: AssetImage('images/delhi_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.blue),
          ),
          title: 'SAFE Student Housing -Student Accommodation For Education ',
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
                  image: AssetImage('images/delhi_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.blue),
          ),
          title: 'Seva Niketan Boys Hostel',
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
                  image: AssetImage('images/delhi_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.blue),
          ),
          title: 'Ganga Niwas Boys Hostel',
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
                  image: AssetImage('images/delhi_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.blue),
          ),
          title: 'Bright Youth Boys Accommodation - Tushar Bindu Building',
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
                  image: AssetImage('images/delhi_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.blue),
          ),
          title: 'Your Space Boys Hostel',
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
                  image: AssetImage('images/delhi_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.blue),
          ),
          title: 'PG in Andheri West',
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
                  image: AssetImage('images/delhi_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.blue),
          ),
          title: 'Jankidevi Bilasrai Bubna Boys Hostel',
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
                  image: AssetImage('images/delhi_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.blue),
          ),
          title: 'Wish Boys Hostel',
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
              'images/delhi_girls.png'),
          
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
                  image: AssetImage('images/delhi_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.pink),
          ),
          title: 'MJs PG for Girls',
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
                  image: AssetImage('images/delhi_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.pink),
          ),
          title: 'Mehta Girls Hostel',
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
                  image: AssetImage('images/delhi_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.pink),
          ),
          title: 'Student Housing Girls Hostel in Mumbai',
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
                  image: AssetImage('images/delhi_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.pink),
          ),
          title: 'M.D.K Ladies Hostel',
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
                  image: AssetImage('images/delhi_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.pink),
          ),
          title: 'Sisters Of The Good Shepherd',
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
                  image: AssetImage('images/delhi_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.pink),
          ),
          title: 'Skyhomes Girls Hostel',
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
                  image: AssetImage('images/delhi_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.pink),
          ),
          title: 'Bright Youth Girls Accommodation',
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
                  image: AssetImage('images/delhi_icon.png'),
                  fit: BoxFit.fill,
                ),
                color: Colors.pink),
          ),
          title: 'Veena Shah Girls’ Paying Guest',
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