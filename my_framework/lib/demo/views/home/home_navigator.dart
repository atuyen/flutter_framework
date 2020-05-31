import 'package:flutter/material.dart';
import 'package:my_framework/demo/views/home/home1/home1_page.dart';
class HomeNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: "/",
      onGenerateRoute: (routeSettings){
        return MaterialPageRoute(
          builder: (_)=>Home1Page()
        );
      },

    );
  }
}
