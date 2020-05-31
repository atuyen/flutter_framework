import 'package:flutter/material.dart';

import 'second.dart';

class TripApp extends StatefulWidget {
  TripApp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TripAppState createState() => _TripAppState();
}

class _TripAppState extends State<TripApp> {

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
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left:30.0, right: 30.0, top: 40.0),
            child: Row(
              children: <Widget>[
                Text("Good Morning", style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0
                ),
                ),
                Spacer(),
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white,),
                )
              ],
            ),
          ),
          SizedBox(height: 30.0,),
          Padding(
            padding: const EdgeInsets.only(left:30.0, right: 30.0),
            child: Text("The Best adventure trips in the world", style: TextStyle(
                color: Colors.black,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Nunito'
            ),),
          ),
          SizedBox(height: 80.0,),
          Padding(
            padding: const EdgeInsets.only(left:30.0),
            child: Container(
              height: 350.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top:20.0, bottom: 20.0),
                    child: Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Container(
                          height: 350.0,
                          width: 250.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("assets/img2.jpg")
                            ),
                          ),
                        ),
                        Positioned(
                          top: -20.0,
                          right: 20.0,
                          child: CircleAvatar(
                            backgroundColor: const Color(0xff57766E),
                            child: Text("GO", style: TextStyle(
                                color: Colors.white
                            ),),
                          ),
                        ),
                        Positioned(
                          top: 15.0,
                          left: 15.0,
                          child: CircleAvatar(
                            radius: 25.0,
                            backgroundColor: Colors.black.withOpacity(0.5),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text("Hard", style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.0
                                ),),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 30.0,
                          left: 15.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Lago di Braies", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Nunito-ExtraBold'
                              ),
                              ),
                              SizedBox(height: 5.0,),
                              Text("Iceland", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontFamily: 'Nunito-Light'
                              ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 30.0,),

                  Padding(
                    padding: const EdgeInsets.only(top:20.0, bottom: 20.0),
                    child: Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Hero(
                          tag: 'place',
                          child: Container(
                            height: 350.0,
                            width: 250.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("assets/img1.jpg")
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: -20.0,
                          right: 20.0,
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SecondTrip()
                                ),
                              );
                            },
                            child: CircleAvatar(
                              backgroundColor: const Color(0xff57766E),
                              child: Text("GO", style: TextStyle(
                                  color: Colors.white
                              ),),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 15.0,
                          left: 15.0,
                          child: CircleAvatar(
                            radius: 25.0,
                            backgroundColor: Colors.white.withOpacity(0.5),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text("Easy", style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.0
                                ),),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 30.0,
                          left: 15.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Short Walk Exploration", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Nunito-ExtraBold'
                              ),
                              ),
                              SizedBox(height: 5.0,),
                              Text("Usa", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontFamily: 'Nunito-Light'
                              ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 20.0,),

                ],
              ),
            ),
          )
        ],
      ),

      bottomNavigationBar: Container(
        height: 100.0,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left:40.0, right: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.apps, color: Colors.grey,),
              Icon(Icons.graphic_eq, color: Colors.grey,),
              Icon(Icons.search, color: Colors.grey,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.teal[700],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left:20.0, right: 20.0, top: 15.0, bottom: 15.0),
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 12.0,
                      child: Icon(Icons.home, color: const Color(0xff57766E), size: 20.0,)),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}