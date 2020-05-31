import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_framework/study/shared/my_primary_button.dart';

class StreamApp extends StatefulWidget {
  @override
  _StreamAppState createState() => _StreamAppState();
}

class _StreamAppState extends State<StreamApp> {
  StreamController<String> streamController = new StreamController();
  StreamController<String> streamController2 = new StreamController();
  StreamSubscription<String> streamSubscription;
  StreamSubscription<Person> streamSubscription2;

  StreamController<String> streamController3 =
      new StreamController.broadcast(); //Add .broadcast here


  final Stream<int> _periodicStream =
      Stream.periodic(Duration(milliseconds: 1000), (i) => i);


  @override
  void initState() {
    super.initState();

    streamController.stream.listen((data) {
      print("DataReceived1: " + data);
    }, onDone: () {
      print("Task Done 1");
    }, onError: (error) {
      print("Some Error1");
    });

    streamSubscription = streamController2.stream.listen((data) {
      print("DataReceived2: " + data);
    }, onDone: () {
      print("Task Done2");
    }, onError: (error) {
      print("Some Error2");
    });

    print("Creating a StreamController...");
    //First subscription
    streamController3.stream.listen((data) {
      print("DataReceived1: " + data);
    }, onDone: () {
      print("Task Done1");
    }, onError: (error) {
      print("Some Error1");
    });
    //Second subscription
    streamController3.stream.listen((data) {
      print("DataReceived2: " + data);
    }, onDone: () {
      print("Task Done2");
    }, onError: (error) {
      print("Some Error2");
    });
  }

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
              label: "Creating a simple stream",
              action: () {
                print("Creating a sample stream...");
                Stream<String> stream = new Stream.fromFuture(getData());
                print("Created the stream");
                stream.listen((data) {
                  print("DataReceived: " + data);
                }, onDone: () {
                  print("Task Done");
                }, onError: (error) {
                  print("Some Error");
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            MyPrimaryButton(
              label: "Creating a simple stream 2",
              action: () {
                print("Creating a sample stream...");
                Stream<int> stream =
                    new Stream.periodic(Duration(seconds: 1), (i) => i).take(5);
                print("Created the stream");
                stream.listen((data) {
                  print("DataReceived: " + data.toString());
                }, onDone: () {
                  print("Task Done");
                }, onError: (error) {
                  print("Some Error");
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            MyPrimaryButton(
              label: " stream handle error",
              action: () {
                print("Creating a sample stream...");
                Stream<String> stream = new Stream.error("co loi");
                print("Created the stream");
                stream.listen((data) {
                  print("DataReceived: " + data);
                }, onDone: () {
                  print("Task Done");
                }, onError: (error) {
                  print("Some Error");
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            MyPrimaryButton(
              label: " Stream controller ",
              action: () {
                this.streamController.add("this is data");
              },
            ),
            SizedBox(
              height: 10,
            ),
            MyPrimaryButton(
              label: "Stream subcription ",
              action: () {
                Stream.periodic(Duration(seconds: 1), (i) => i)
                    .take(10)
                    .listen((i) => this.streamController2.add(i.toString()));

                Future.delayed(Duration(seconds: 3), () {
                  this.streamSubscription.pause();
                });
                Future.delayed(Duration(seconds: 6), () {
                  this.streamSubscription.resume();
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            MyPrimaryButton(
              label: " Stream transform ",
              action: () {
                streamSubscription2 =
                    Stream.periodic(Duration(seconds: 1), (i) => i)
                        .transform<Person>(StreamTransformer.fromHandlers(
                            handleData: (data, sink) {
                  Person person = new Person(data, "person $data");
                  sink.add(person);
                })).listen((Person person) {
                  print(person.name);
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            MyPrimaryButton(
              label: "  Broadcast Streams ",
              // cho phep tao ra nhieu subcription lang nghe
              action: () {
                streamController3.add("This a test data");
              },
            ),
            SizedBox(
              height: 10,
            ),
            MyPrimaryButton(
              label: "  Stream builder ",
              action: () {

              },
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(8),
              child: StreamBuilder(
                stream: this._periodicStream,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.data);
                   return Text(snapshot.data.toString());
                  }
                  return Container();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<String> getData() async {
    await Future.delayed(Duration(seconds: 5)); //Mock delay
    print("Fetched Data");
    return "This a test data";
  }

  @override
  void dispose() {
    streamController.close(); //Streams must be closed when not needed
    streamController2.close();
    streamSubscription.cancel();
    streamSubscription2.cancel();
    streamController3.close();
    super.dispose();
  }
}

class Person {
  int age;
  String name;

  Person(int age, String name) {
    this.age = age;
    this.name = name;
  }
}
