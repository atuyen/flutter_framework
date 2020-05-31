import 'package:flutter/material.dart';
import 'package:my_framework/demo/base/base_bloc.dart';

class SearchWidget extends StatelessWidget {
  final BaseBloc bloc;

  const SearchWidget({Key key, this.bloc}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("Search"),
      onPressed: (){
        bloc.search("abc");
      },
    );
  }
}
