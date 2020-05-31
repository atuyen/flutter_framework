import 'package:flutter/material.dart';

import 'details.dart';



class Fashion3 extends StatefulWidget {
  @override
  _Fashion3State createState() => _Fashion3State();
}

class _Fashion3State extends State<Fashion3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: ()=>Navigator.pop(context),
          heroTag: 'buton 3',
        ),
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset('assets/pic4.jpeg', fit: BoxFit.cover, height: 400.0),
                Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 40.0),
                      Text(
                        'Louis W. & A.P.C',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 40.0,
                            color: Colors.white),
                      ),
                      Text(
                        'Drop a Chic Selection of Outerwear',
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w200),
                      ),
                      SizedBox(height: 7.0),
                      Text(
                        'for 2019 Spring/Summer',
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w200),
                      ),
                      SizedBox(height: 175.0),
                      FloatingActionButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailInfo()
                          ));
                        },
                        mini: true,
                        elevation: 0.0,
                        backgroundColor: Colors.white,
                        child: Center(
                            child: Icon(Icons.arrow_forward, color: Colors.black)),
                      )
                    ],
                  ),
                )
              ],
            ),
            Stack(
              children: <Widget>[
                Image.asset('assets/pic5.jpeg', fit: BoxFit.cover, height: 400.0)
              ],
            )
          ],
        ));
  }
}