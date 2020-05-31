import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart';

// ChangeNotifierProvide
class Counter1 with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  increment() {
    _count++;
    notifyListeners();
  }
}

class Counter2 with ChangeNotifier {
  int _count = 10;

  int get count => _count;

  increment() {
    _count++;
    notifyListeners();
  }
}

class DemoMultipleProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Navigator.pop(context),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Counter1()),
          ChangeNotifierProvider(create: (_) => Counter2()),
        ],
        child: TestWidget1(),
      ),
    );
  }
}

class TestWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Counter1 counter1 = Provider.of<Counter1>(context);
    Counter2 counter2 = Provider.of<Counter2>(context);

    return Center(
      child: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text(
            'count1 = ${counter1.count.toString()} count2 = ${counter2.count.toString()}',
            style: TextStyle(fontSize: 40),
          ),
          RaisedButton(
            onPressed: () {
              counter1.increment();
              counter2.increment();
            },
            child: Text(
              "Increment",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ]),
      ),
    );
  }
}

