import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DemoChangeNotifier2 extends StatefulWidget {
  @override
  _DemoChangeNotifier2State createState() => _DemoChangeNotifier2State();
}

class _DemoChangeNotifier2State extends State<DemoChangeNotifier2> {
  CouterModel couterModel = new CouterModel();


  @override
  Widget build(BuildContext context) {
    print("Build...");
    return ChangeNotifierProvider.value(
      value: couterModel,
      child: Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: ()=>Navigator.pop(context),
        ),
        body: Column(
          children: [
            SizedBox(height: 10,),
            /// Xu dung consumer de lang nghe thi se ko bi rebuild toan bo con, ma chi rebuild phan trong consumer
            Consumer<CouterModel>(builder:(context,value,child)=> Text("Couter value ${value.countValue}")),
            SizedBox(height: 10,),
            RaisedButton(
              child: Text("++"),
              onPressed: ()=>couterModel.tangGiaTri(),
            )
          ],
        ),
      ),
    );
  }
}



class CouterModel extends ChangeNotifier {
  int countValue=0;

  void tangGiaTri(){
    print(countValue);
    countValue++;
    notifyListeners();
  }

}