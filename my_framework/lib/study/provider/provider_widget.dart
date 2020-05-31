import 'package:flutter/material.dart';
import 'package:my_framework/study/provider/basic_provider.dart';
import 'package:my_framework/study/provider/demo_change_notifier.dart';
import 'package:my_framework/study/provider/demo_change_notifier2.dart';
import 'package:my_framework/study/provider/demo_future_provider.dart';
import 'package:my_framework/study/provider/demo_proxy_provider.dart';
import 'package:my_framework/study/provider/demo_stream_provider.dart';



import '../study_screen.dart';
import 'demo_multiple_provider.dart';

class ProviderExample extends StatefulWidget {
  @override
  _ProviderExampleState createState() => _ProviderExampleState();
}

class _ProviderExampleState extends State<ProviderExample> {
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

            SizedBox(height: 20,),

            _item("basic",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>BasicProvider()))),
            _item("deme change notifer",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>DemoChangeNotifierProvider()))),
            _item("deme change notifer 2",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>DemoChangeNotifier2()))),
            _item("multi provider",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>DemoMultipleProvider()))),
            _item("proxy provider",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>DemoProxyProvider()))),
            _item("future provider",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>DemoFutureProvider()))),
            _item("stream provider",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>DemoStreamProvider()))),
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





