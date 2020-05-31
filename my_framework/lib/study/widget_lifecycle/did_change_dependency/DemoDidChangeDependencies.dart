import 'package:flutter/material.dart';

class Demo3 extends StatefulWidget {
  @override
  _Demo3State createState() => new _Demo3State();
}

class _Demo3State extends State<Demo3> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ShareDataWidget(
          data: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TestDidChangeDependenciesWidget(),
              RaisedButton(
                child: Text("Increment"),
                onPressed: () => setState(() => ++count),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TestDidChangeDependenciesWidget extends StatefulWidget {
  @override
  _TestDidChangeDependenciesState createState() =>
      _TestDidChangeDependenciesState();
}

class _TestDidChangeDependenciesState
    extends State<TestDidChangeDependenciesWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      ShareDataWidget.of(context).data.toString(),
      style: TextStyle(fontSize: 20),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("init statee");
  }

  @override
  void didUpdateWidget(TestDidChangeDependenciesWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Dependencies change");
  }
}

class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({@required this.data, Widget child}) : super(child: child);

  final int data;

  static ShareDataWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
  }

  @override
  bool updateShouldNotify(ShareDataWidget old) {
    return true;
  }
}