import 'package:flutter/material.dart';

class WigetCon extends StatefulWidget {
  final int input;

  const WigetCon({Key key, this.input}) : super(key: key);
  @override
  _WigetConState createState() => _WigetConState();
}

class _WigetConState extends State<WigetCon> {
  int x =9;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("init state trong con");
  }



  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("did change dependencies trong con");
  }





  @override
  Widget build(BuildContext context) {
    print("build trong con");
    return Container(
      height: 50,
      color: Colors.green,
      child: Column(
          children: <Widget>[
            FlatButton(
              child: Text("Change value trong con"),
              onPressed: (){
                setState(() {
                  x++;
                });
              },
            )

          ],

      ),
    );
  }


  @override
  void didUpdateWidget(WigetCon oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("did update trong con");
  }


@override
  void dispose() {
    // TODO: implement dispose
    print("dispose trong con");
    super.dispose();
  }



}
