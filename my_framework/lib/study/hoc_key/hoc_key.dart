import 'package:flutter/material.dart';
import 'package:my_framework/study/hoc_key/global_key_meaning.dart';
import 'package:my_framework/study/hoc_key/key_for_dismiss.dart';
import 'package:my_framework/study/hoc_key/key_for_form.dart';
import 'package:my_framework/study/study_screen.dart';


class HocKey extends StatefulWidget {
  @override
  _HocKeyState createState() => _HocKeyState();
}

class _HocKeyState extends State<HocKey> {
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
            _item("Global key meaning",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>GlobalKeyMeaning()))),
            _item("Key For Form",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>KeyForForm()))),
            _item("Key For Dismiss",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>KeyDismiss()))),
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
