import 'package:flutter/material.dart';
import 'package:my_framework/demo/views/business/business1/business1_page.dart';

class BusinessNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: "/",
      onGenerateRoute: (routeSettings){
        return MaterialPageRoute(
            builder: (_)=>Business1Page()
        );
      },

    );
  }
}
