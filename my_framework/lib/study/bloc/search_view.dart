import 'package:flutter/material.dart';


import 'search_box.dart';
import 'search_result.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          SearchBox(),
          Expanded(
            child: Result(),
          )
        ],
      ),
    );
  }
}
