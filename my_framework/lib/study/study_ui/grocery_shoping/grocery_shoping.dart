import 'dart:math';

import 'package:flutter/material.dart';
import '../ui_lv1.dart';
import 'SizeConfig.dart';
import 'dairy.dart';
import 'fruits.dart';
import 'nuts.dart';
import 'vegetables.dart';





class Shopping extends StatelessWidget {
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
              home: GroceryStore(),
            );
          },
        );
      },
    );
  }
}




class GroceryStore extends StatefulWidget {
  GroceryStore({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GroceryStoreState createState() => _GroceryStoreState();
}

class _GroceryStoreState extends State<GroceryStore> with SingleTickerProviderStateMixin{
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    print(SizeConfig.imageSizeMultiplier);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.red,
        onPressed: ()=>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>UILevel1()), (route)=>false),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.menu, color: Colors.black, size: 6 * SizeConfig.imageSizeMultiplier,),
                Spacer(),
                Icon(Icons.shopping_cart, color: Colors.black, size: 6 * SizeConfig.imageSizeMultiplier,)
              ],
            ),
          ),
          SizedBox(height: 5 * SizeConfig.heightMultiplier,),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(color: Colors.grey, width: 0.5),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  children: <Widget>[
                    Text("Search here", style: TextStyle(
                        color: Colors.grey,
                        fontSize: 2.4 * SizeConfig.textMultiplier,
                        fontFamily: 'OpenSans'
                    ),),
                    Spacer(),
                    Icon(Icons.search, color: Colors.black, size: 6 * SizeConfig.imageSizeMultiplier,)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 5 * SizeConfig.heightMultiplier,),
          TabBar(
              controller: tabController,
              indicatorColor: Colors.green,
              indicatorWeight: 3.0,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  child: Text("Fruits", style: TextStyle(
                      fontSize: 2.5 * SizeConfig.textMultiplier,
                      fontFamily: 'OpenSans'
                  ),),
                ),
                Tab(
                  child: Text("Vegetables", style: TextStyle(
                      fontSize: 2.5 * SizeConfig.textMultiplier,
                      fontFamily: 'OpenSans'
                  ),),
                ),
                Tab(
                  child: Text("Nuts & Seeds", style: TextStyle(
                      fontSize: 2.5 * SizeConfig.textMultiplier,
                      fontFamily: 'OpenSans'
                  ),),
                ),
                Tab(
                  child: Text("Dairy", style: TextStyle(
                      fontSize: 2.5 * SizeConfig.textMultiplier,
                      fontFamily: 'OpenSans'
                  ),),
                ),
              ]),
          Expanded(
            child: Container(
              child: TabBarView(
                  controller: tabController,
                  children: <Widget>[
                    Fruits(),
                    Vegetables(),
                    Nuts(),
                    Dairy(),
                  ]),
            ),
          )
        ],
      ),

    );
  }
}