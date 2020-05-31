import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_framework/study/shared/my_primary_button.dart';

class FurtureApp extends StatefulWidget {
  @override
  _FurtureAppState createState() => _FurtureAppState();
}

class _FurtureAppState extends State<FurtureApp> {
  String ketqua = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            MyPrimaryButton(
              label: "Furture Void",
              action: () {
                async1();
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text("ketqua: $ketqua"),
            SizedBox(
              height: 10,
            ),
            MyPrimaryButton(
              label: "Furture int 1",
              action: () {
                async2().then((value) {
                  this.setState(() {
                    ketqua = value.toString();
                  });
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text("ketqua: $ketqua"),
            SizedBox(
              height: 10,
            ),
            MyPrimaryButton(
              label: "Furture int 2",
              action: () async {
                int kq = await async2();
                setState(() {
                  this.ketqua = kq.toString();
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text("ketqua: $ketqua"),
            SizedBox(
              height: 10,
            ),
            MyPrimaryButton(
              label: "Furture handel error",
              action: () {
                async3().then((data) {
                  print(data);
                }).catchError((err) {
                  print("Co loi ${err.toString()}");
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            MyPrimaryButton(
              label: "Furture handel error  2",
              action: () async {
                try {
                  int data = await async3();
                  print(data);
                } catch (err) {
                  print("Co loi ${err.toString()}");
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            MyPrimaryButton(
              label: "Multi Furture",
              action: () async {
                try {
                  var futures = List<Future>();
                  futures.addAll([async2(), async4()]);
                  List datas = await Future.wait(futures);
                  print(datas[0]);
                  print(datas[1]);
                } catch (err) {
                  print("Co loi ${err.toString()}");
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            MyPrimaryButton(
              label: "Multi Furture Error",
              action: () async {
                try {
                  var futures = List<Future>();
                  futures.addAll([async2(), async3()]);
                  List datas = await Future.wait(futures);
                  print(datas[0]);
                  print(datas[1]);
                } catch (err) {
                  print("Co loi ${err.toString()}");
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text("Furture Builder"),
            FutureBuilder<String>(
              future:
                  _calculation, // a previously-obtained Future<String> or null
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                List<Widget> children;
                if (snapshot.hasData) {
                  children = <Widget>[
                    Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('Result: ${snapshot.data}'),
                    )
                  ];
                } else if (snapshot.hasError) {
                  children = <Widget>[
                    Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('Error: ${snapshot.error}'),
                    )
                  ];
                } else {
                  children = <Widget>[
                    SizedBox(
                      child: CircularProgressIndicator(),
                      width: 60,
                      height: 60,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Awaiting result...'),
                    )
                  ];
                }
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: children,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> async1() {
    Future.delayed(Duration(seconds: 1), () {
      print("finish");
      setState(() {
        ketqua = "da xu ly";
      });
    });
  }

  Future<int> async2() {
    return Future.delayed(Duration(seconds: 1), () => 5);
  }

  Future<String> async4() {
    return Future.delayed(Duration(seconds: 1), () => "hello");
  }

  Future<int> async3() {
    return Future.delayed(
        Duration(seconds: 1), () => throw Exception("Co loi roi"));
  }

  Future<String> _calculation = Future<String>.delayed(
    Duration(seconds: 2),
    () {
      print("canculate");
      return 'Data Loaded';
    },
  );
}
