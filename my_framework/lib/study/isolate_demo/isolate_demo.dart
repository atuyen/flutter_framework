import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class IsolateDemo extends StatefulWidget {
  @override
  _IsolateDemoState createState() => _IsolateDemoState();
}

class _IsolateDemoState extends State<IsolateDemo>  with SingleTickerProviderStateMixin{

  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 7),
    );

    animationController.repeat();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Navigator.pop(context),
      ),
      body: Center(
       child: Column(
         children: [
           AnimatedBuilder(
             animation: animationController,
             child: new Container(
               height: 150.0,
               width: 150.0,
               child: new Image.asset('assets/images/batmanlogo.png'),
             ),
             builder: (BuildContext context, Widget _widget) {
               return new Transform.rotate(
                 angle: animationController.value * 6.3,
                 child: _widget,
               );
             },
           ),

          SizedBox(height: 20,),

          RaisedButton(
            child: Text("Tinh tong binh thuong"),
            onPressed: (){
              sum().then((value) => print(value));
            },
          ),

           SizedBox(height: 20,),

           RaisedButton(
             child: Text("Tinh tong dung isolate"),
             onPressed: (){
              createNewIsolate();
             },
           ),
           SizedBox(height: 20,),

           RaisedButton(
             child: Text("Tinh tong dung isolate 2 chieu test"),
             onPressed: (){
               createNewIsolate2way();
             },
           ),

           SizedBox(height: 20,),

           RaisedButton(
             child: Text("demo compute"),
             onPressed: (){
               demoCompute();
             },
           )
         ],
       ),
      ),


    );
  }


  Future<int> sum() async{
    var total =0;
    for(int i=0;i<1000000000;i++){
      total+=i;
    }
    return total;
  }

  void createNewIsolate() async{
    var receivePort = ReceivePort();
    ///khong gian main isolate
   var isonate = await  Isolate.spawn(taskRunner, receivePort.sendPort);
    receivePort.listen((data) {
      print(data);


      isonate.kill(priority: Isolate.immediate );
    });

  }

  static void taskRunner(SendPort sendPort){
    ///khong gian new isolate
    var total =0;
    for(int i=0;i<1000000000;i++){
      total+=i;
    }
    sendPort.send(total);
  }



  void createNewIsolate2way(){
    var receivePort = ReceivePort();
    ///khong gian main isolate
    Isolate.spawn(taskRunner2way, receivePort.sendPort);

    receivePort.listen((data) {
      print(data[0]);
      if(data[1] is SendPort){
        data[1].send("From main isolate");
      }
    });

  }

  static void taskRunner2way(SendPort sendPort){
    ///khong gian new isolate

    var  receivePort = ReceivePort();
    receivePort.listen((data) {
      print(data);
    });

    var total =0;
    for(int i=0;i<1000000000;i++){
      total+=i;
    }
    sendPort.send([total,receivePort.sendPort]);
  }


  void demoCompute() async{
    var result = await compute(caculate,1000000000);
    print(result);

  }

  static int caculate(int num){
    var total =0;
    for(int i=0;i<num;i++){
      total+=i;
    }
    return total;
  }


  @override
  void dispose() {
    animationController.stop();
    super.dispose();
  }







}
