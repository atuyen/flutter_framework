
import 'package:flutter/material.dart';
class MyPadding extends StatelessWidget {
  final double paddingLeft,paddingRight,paddingTop,paddingBottom;
  final Widget child;
  MyPadding({this.paddingLeft,this.paddingBottom,this.paddingTop,this.paddingRight,this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: paddingLeft!=null?paddingLeft:0,
          right: paddingRight!=null?paddingRight:0,
          top: paddingTop!=null?paddingTop:0,
          bottom: paddingBottom!=null?paddingBottom:0
      ),

    );
  }
}
