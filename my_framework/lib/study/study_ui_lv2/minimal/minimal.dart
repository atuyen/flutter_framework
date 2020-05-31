import 'dart:ffi';
//import 'dart:html';

import 'package:flutter/material.dart';

import 'dashboard.dart';



class MinimalApp extends StatefulWidget {
  @override
  _MinimalAppState createState() => _MinimalAppState();
}

class _MinimalAppState extends State<MinimalApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: ()=>Navigator.pop(context),
        ),
        body: DashboardPage(
            currencyVal: 0.0,
            convertedCurrency: 0.0,
            currencyone: 'USD',
            currencytwo: 'RUB',
            isWhite: false));
  }
}
