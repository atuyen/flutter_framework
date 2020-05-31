import 'package:flutter/material.dart';

class ChiaSeDuLieu extends StatefulWidget {
  const ChiaSeDuLieu({Key key}) : super(key: key);

  @override
  _ChiaSeDuLieuState createState() => _ChiaSeDuLieuState();
}

class _ChiaSeDuLieuState extends State<ChiaSeDuLieu> {
  int countValue = 10;

  tangCountValue(){
    setState(() {
      countValue++;
    });
  }
  giamCountValue(){
    setState(() {
      countValue--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MyInheritedWidget(
          myState: this,
          child: Container(
            color: Colors.yellow,
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Text("InheritedWidget"),
                SizedBox(height: 10,),
                OngBa()
              ],
            ),
          ),
        ),
      ),
    );
  }
}



///Co 1 gia tri can chi se trong cay widget
///==>Tao ra 1 inherit widget va boc cay widget ben trong do
class MyInheritedWidget extends InheritedWidget {
  final _ChiaSeDuLieuState myState;

  MyInheritedWidget({Key key, Widget child, @required this.myState})
      : super(key: key, child: child);


  static MyInheritedWidget of(BuildContext context) {
    // ignore: deprecated_member_use
    return context.inheritFromWidgetOfExactType(MyInheritedWidget);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return false;
  }
}





class OngBa extends StatefulWidget {
  @override
  _OngBaState createState() => _OngBaState();
}

class _OngBaState extends State<OngBa> {




  @override
  Widget build(BuildContext context) {
    final rootWidgetsState = MyInheritedWidget.of(context).myState;
    return Container(
      padding: EdgeInsets.all(5.0),
      color: Colors.blue,
      child: Column(
        children: <Widget>[
          Text("Counter trong ong ba ${rootWidgetsState.countValue}"),
          Row(
            children: <Widget>[
              FloatingActionButton(
                child: Text("++"),
                onPressed: (){
                  rootWidgetsState.tangCountValue();
                },
                heroTag: "buton1",
              ),
              SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                child: Text("--"),
                onPressed: (){
                  rootWidgetsState.giamCountValue();
                },
                heroTag: "buton2",
              )
            ],
          ),
          SizedBox(height: 20,),
          ChaMe()
        ],
      ),
    );
  }
}

class ChaMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rootWidgetsState = MyInheritedWidget.of(context).myState;
    return Container(
        padding: EdgeInsets.all(5.0),
        color: Colors.green,
        child: Column(children: <Widget>[
          Text("Counter trong cha me  ${rootWidgetsState.countValue} "),
          Row(
            children: <Widget>[
              FloatingActionButton(
                child: Text("++"),
                onPressed: (){
                  rootWidgetsState.tangCountValue();
                },
                heroTag: "buton3",
              ),
              SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                child: Text("--"),
                onPressed: (){
                  rootWidgetsState.giamCountValue();
                },
                heroTag: "buton4",
              )
            ],
          ),
          SizedBox(height: 20,),
          ConChau()
        ]));
  }
}

class ConChau extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rootWidgetsState = MyInheritedWidget.of(context).myState;
    return Container(
        padding: EdgeInsets.all(5.0),
        color: Colors.red,
        child: Column(children: <Widget>[
          Text("Counter trong chau  ${rootWidgetsState.countValue}"),
          Row(
            children: <Widget>[
              FloatingActionButton(
                child: Text("++"),
                heroTag: "buton5",
                onPressed: (){
                  rootWidgetsState.tangCountValue();
                },
              ),
              SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                child: Text("--"),
                heroTag: "buton6",
                onPressed: (){
                  rootWidgetsState.giamCountValue();
                },
              )
            ],
          ),
        ]));
  }
}
