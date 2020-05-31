import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_framework/study/widget_lifecycle/did_change_dependency/DemoDidChangeDependencies.dart';
import 'package:my_framework/study/widget_lifecycle/did_update_widget/trangmoi.dart';
import 'package:my_framework/study/widget_lifecycle/did_update_widget/widget_con.dart';

class DidUpdateApp extends StatefulWidget {
  @override
  _DidUpdateAppState createState() => _DidUpdateAppState();
}

class _DidUpdateAppState extends State<DidUpdateApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("init state trong cha");
    SchedulerBinding.instance.addPostFrameCallback((_){
      ///This is a callback for the end of the frame, it only gets called once and we know for sure that the Widget build is completed.
      print("addPostFrameCallback trong cha");
    });
  }


  int param = 10;
  int y =5;
  @override
  Widget build(BuildContext context) {
    print("build trong cha");
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("=============Test Did update========="),

            WigetCon(
              input: param,
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              child: Text("Change param tu cha"),
              onPressed: () {
                this.setState(() {
                  this.param = 15;
                });
              },
            ),
            FlatButton(
              child: Text("thay doi 1 gia tri gi do trong cha ko lien quan den con"),
              onPressed: () {
                this.setState(() {
                  this.y = 15;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              child: Text("Sang trang moi de test tiep"),
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>TrangMoi())),
            )
          ],
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(DidUpdateApp oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("did update trong cha");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("channge dependency trong cha");
  }


  @override
  void dispose() {
    // TODO: implement dispose
    print("dispose trong cha");
    super.dispose();
  }
}
