import 'package:catcher/catcher_plugin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/route_config.dart';
import 'config/dependency_configr.dart';
import 'config/theme_config.dart';


void main() async {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MCBook App',
        theme: themeConfig(),
        initialRoute: '/',
        routes: routeConfig());
  }
}
