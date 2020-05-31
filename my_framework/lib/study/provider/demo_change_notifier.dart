import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart';

// ChangeNotifierProvide
class Counter with ChangeNotifier {
  int _count = 0;

  set count(int value) {
    _count = value;
  }

  int get count => _count;

  increment() {
    _count++;
    notifyListeners();
  }
}

class DemoChangeNotifierProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build cha");
    Counter c1 = Counter();
    c1.count = 6;
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Navigator.pop(context),
      ),
      body: ChangeNotifierProvider<Counter>.value(
        value: c1,
        child: TestWidget(),
      ),
    );
  }
}

class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///Xu dung cach lay nay thi se rebuild lai toan bo thang con
    /// dung consumer thi se tranh duoc viec nay, chi rebuild lai phan nam tron gconsumer
    Counter counter = Provider.of<Counter>(context);
    print("build con");
    return Center(
      child: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text(
            counter.count.toString(),
            style: TextStyle(fontSize: 40),
          ),
          RaisedButton(
            onPressed: () {
              counter.increment();
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
