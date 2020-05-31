import 'package:flutter/material.dart';

import 'home.dart';
import 'inbox.dart';
import 'library.dart';



class YouTubeApp extends StatefulWidget {
  @override
  _YouTubeAppState createState() => _YouTubeAppState();
}

class _YouTubeAppState extends State<YouTubeApp> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    Home(),
    Inbox(),
    Library(),
  ];
  void onTabTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.red,
        child: Text("Back"),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
      body: SafeArea(child: _children[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
          items: [
            new BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("Home", style: TextStyle(
                    fontSize: 12.0
                ),)),
            new BottomNavigationBarItem(
                icon: Icon(Icons.mail),
                title: Text("Inbox", style: TextStyle(
                    fontSize: 12.0
                ),)),
            new BottomNavigationBarItem(
                icon: Icon(Icons.video_library),
                title: Text("Library", style: TextStyle(
                    fontSize: 12.0
                ),)),
          ]
      ),
    );
  }
}
