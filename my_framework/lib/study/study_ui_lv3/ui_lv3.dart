import 'package:flutter/material.dart';
import 'package:my_framework/study/study_screen.dart';
import 'package:my_framework/study/study_ui_lv3/chat_app/chart_app.dart';
import 'package:my_framework/study/study_ui_lv3/travel_app/travel_app.dart';


class UILevel3 extends StatefulWidget {
  @override
  _UILevel3State createState() => _UILevel3State();
}

class _UILevel3State extends State<UILevel3> {
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
            _item("Chat app",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>ChartApp()))),
            _item("Travel app",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>TravelApp()))),
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
