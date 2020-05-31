import 'package:flutter/material.dart';

/// Mac Dinh Khi rebuild cha thi con se bi rebuild theo
///==>Giai phap de chi dinh widget con nao do khong bi rebuild khi cha rebuil la dung const

class DemoUseConst extends StatefulWidget {
  @override
  _DemoUseConstState createState() => _DemoUseConstState();
}

class _DemoUseConstState extends State<DemoUseConst> {
  int x = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Navigator.pop(context),
      ),
      body: Column(
        children: [
          Text("Value in parent $x"),
          SizedBox(
            height: 10,
          ),
          const Con1(),
          SizedBox(
            height: 10,
          ),
//        const Con2(x:x) ==>Khong the khai bao const, vi x khong phai const
          Con2(x: x),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            child: Text("rebuild"),
            onPressed: () => setState(() {
              x = 5;
            }),
          )
        ],
      ),
    );
  }
}

class Con1 extends StatefulWidget {
  const Con1();

  @override
  _Con1State createState() => _Con1State();
}

class _Con1State extends State<Con1> {
  @override
  Widget build(BuildContext context) {
    print("build con 1");
    return Container(
      child: Text("Con 1"),
    );
  }
}

class Con2 extends StatefulWidget {
  final int x;

  const Con2({Key key, this.x}) : super(key: key);

  @override
  _Con2State createState() => _Con2State();
}

class _Con2State extends State<Con2> {
  @override
  Widget build(BuildContext context) {
    print("build con 2");
    return Container(
      child: Text("Con 2"),
    );
  }
}
