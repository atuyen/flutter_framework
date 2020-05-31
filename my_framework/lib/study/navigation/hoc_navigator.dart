import 'package:flutter/material.dart';
import 'package:my_framework/study/navigation/pass_arguments_to_a_named_route/pass_argument_by_name_route.dart';

import '../study_screen.dart';
import 'navigate_to_a_new_screen_and_back/basic_route.dart';
import 'navigate_with_named_routes/naviget_by_name.dart';


class HocNavigator extends StatefulWidget {
  @override
  _HocNavigatorState createState() => _HocNavigatorState();
}

class _HocNavigatorState extends State<HocNavigator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          InkWell(
            child: Text("Back"),
            onTap: ()=>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>StudyScreen()), (_)=>false),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10,),
            _item("Basic navigate",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>BasicFirstRoute()))),
            _item("Navigate by route name",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>getNavigateByNameApp()))),
            _item("Pass parameter by route name",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>PassArgumentByNameRoute()))),
          ],
        ),
      ),


    );
  }




  Widget _item(text,callBack){
    return Column(
      children: <Widget>[
        InkWell(
          onTap: (){
            callBack();
          },
          child: Text(text),
        ),
        SizedBox(height: 10,),
      ],
    );

  }
}