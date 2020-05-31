import 'package:flutter/material.dart';
import 'package:my_framework/demo/views/home/home2/home2_page.dart';

class Business2_page extends StatelessWidget {
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
            Text("Business 2"),
            SizedBox(height: 20,),
            RaisedButton(
              child: Text("back"),
              onPressed: (){

              },
            )

          ],

        ),
      ),
    );
  }
}
