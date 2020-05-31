import 'package:flutter/material.dart';
import 'package:my_framework/demo/views/authen/sign_in/login_page.dart';
import 'package:my_framework/demo/views/main/main_page.dart';
import 'package:my_framework/demo/views/splash_screen/splash_screen.dart';
import '../constant/route_constant.dart';

Map<String, WidgetBuilder> routeConfig() {
  return <String, WidgetBuilder>{
    '/': (context) => SplashScreen(),
    RouteConstant.SIGN_IN: (context) => LoginPage(),
    RouteConstant.MAIN_PAGE: (context) => MainPage(),
  };
}
