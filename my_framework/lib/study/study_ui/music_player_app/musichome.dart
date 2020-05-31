import 'package:flutter/material.dart';

import '../ui_lv1.dart';
import 'SizeConfig.dart';
import 'albums.dart';
import 'artists.dart';
import 'podcasts.dart';




class MusicPlayerApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'HomeScreen App',
              home: MusicHome(),
            );
          },
        );
      },
    );
  }
}

class MusicHome extends StatefulWidget {
  MusicHome({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MusicHomeState createState() => _MusicHomeState();
}

class _MusicHomeState extends State<MusicHome> with SingleTickerProviderStateMixin{
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.red,
        onPressed: ()=>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>UILevel1()), (route)=>false),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.search, color: Colors.black,),
                Spacer(),
                Icon(Icons.more_vert, color: Colors.black,),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 40.0),
            child: Text("Browse", style: TextStyle(
              color: Colors.black,
              fontFamily: 'Nunito-Regular',
              fontSize: 4.5 * SizeConfig.textMultiplier
            ),),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 40.0),
            child: TabBar(
              controller: tabController,
              indicatorColor: Colors.blue[900],
                indicatorWeight: 2.0,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.black,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold
                ),
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                tabs: <Widget>[
                  Tab(
                    child: Text("ALBUMS", style: TextStyle(
                      fontSize: 2 * SizeConfig.textMultiplier,
                      fontFamily: 'Nunito'
                    ),),
                  ),
                  Tab(
                    child: Text("ARTISTS", style: TextStyle(
                        fontSize: 2 * SizeConfig.textMultiplier,
                        fontFamily: 'Nunito'
                    ),),
                  ),
                  Tab(
                    child: Text("PODCASTS", style: TextStyle(
                        fontSize: 2 * SizeConfig.textMultiplier,
                        fontFamily: 'Nunito'
                    ),),
                  ),
            ]),
          ),
          Expanded(
            child: Container(
              child: TabBarView(
                controller: tabController,
                  children: <Widget>[
                    Albums(),
                    Artists(),
                    Podcasts()
                  ]),
            ),
          )
        ],
      ),

    );
  }
}