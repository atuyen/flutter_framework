import 'package:flutter/material.dart';
import 'package:my_framework/demo/views/home/home2/home2_page.dart';

class Business1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.menu),
          onTap: () {

          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text("business 1"),
            SizedBox(height: 20,),
            RaisedButton(
              child: Text("Sang Home 2"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>Home2Page()));
              },
            )

          ],

        ),
      ),
    );
  }
}
