import 'package:flutter/material.dart';
import 'package:my_framework/study/inherited_widget/basic_inherite.dart';
import 'package:my_framework/study/inherited_widget/chia_se_du_lieu.dart';
import 'package:my_framework/study/inherited_widget/thua_ke_du_lieu.dart';


import '../study_screen.dart';

class InheritedExample extends StatefulWidget {
  @override
  _InheritedExampleState createState() => _InheritedExampleState();
}

class _InheritedExampleState extends State<InheritedExample> {
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
            Text("Inherited widget dung de chia se du lieu trong cay widget, cung co the dung voi y nghia de ke thua du lieu cua widget ong ch"),
            SizedBox(height: 20,),

            _item("basic",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>BasicInherite()))),
            _item("Chia se du lieu",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>ChiaSeDuLieu()))),
           _item("thua ke du lieu",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>ThuaKeDuLieu()))),

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





