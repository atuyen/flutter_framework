import 'package:flutter/material.dart';
import 'package:my_framework/study/service_locator.dart';

import 'bank_service.dart';


class DemoDependencyInjection extends StatefulWidget {
  @override
  _DemoDependencyInjectionState createState() => _DemoDependencyInjectionState();
}

class _DemoDependencyInjectionState extends State<DemoDependencyInjection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Navigator.pop(context),
      ),
      body: Column(
        children: [
          RaisedButton(
            child: Text("Thanh Toan"),
            onPressed: (){
              var bankService = getIt<BankService>();
              bankService.thanhToan();
            },
          )
        ],
      ),
    );
  }
}
