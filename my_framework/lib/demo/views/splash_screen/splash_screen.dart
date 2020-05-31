import 'package:flutter/material.dart';
import 'package:my_framework/demo/constant/route_constant.dart';
import 'package:my_framework/demo/utils/shared_preferences_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {



  @override
  void initState(){
    super.initState();
    fetchSomething();
  }

  void fetchSomething() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    SharedPreferencesUtils.setInstance(prefs);

    Future.delayed(Duration(seconds: 1),(){
          Navigator.pushNamedAndRemoveUntil(context, RouteConstant.MAIN_PAGE,(predicate)=>false);
    });


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
