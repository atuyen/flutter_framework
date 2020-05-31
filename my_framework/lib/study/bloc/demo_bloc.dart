import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'search_bloc.dart';
import 'search_view.dart';

//Luu y khong long bloc trong bloc

class DemoBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo Bloc"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()=>Navigator.pop(context),
        ),
        body: Provider<SearchBloc>(
          create:(_)=> SearchBloc(),
          child: SearchView(),
        ),
      ),
    );
  }
}