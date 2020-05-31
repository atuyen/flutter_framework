import 'package:flutter/material.dart';



class BasicInherite extends StatefulWidget {
  @override
  _BasicInheriteState createState() => _BasicInheriteState();
}

class _BasicInheriteState extends State<BasicInherite> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: ()=>Navigator.pop(context),
        ),
        body: Center(child: MyInherited(child: Ongba()),),
      ),


    );
  }
}


class MyInherited extends InheritedWidget {

  final int count=100;
  const MyInherited({
    Key key,
    @required Widget child,
  })
      : assert(child != null),
        super(key: key, child: child);

  static MyInherited of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(MyInherited) as MyInherited;
  }

  @override
  bool updateShouldNotify(MyInherited old) {
    return true;
  }


}


class Ongba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Bome(),
    );
  }
}

class Bome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Concai(),
    );
  }
}

class Concai extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    MyInherited myInherite = context.inheritFromWidgetOfExactType(MyInherited);

    return Container(
      child: Text("con cai duoc "+myInherite.count.toString()),
    );
  }
}



/// Không thể hiện được ý nghĩa ông bà để lại của cải cho con cháu
/// Khi muốn thay đổi giá trị của cái để lại thì làm thé nào vì inherite widget không có hàm setState()





