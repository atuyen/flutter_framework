import 'package:flutter/material.dart';
import 'package:my_framework/demo/base/base_bloc.dart';
import 'package:provider/provider.dart';
import '../shared/widget/empty_appbar_widget.dart';

class PageContainer extends StatelessWidget {
  final Widget child;
  final Widget appBar;
  final List<BaseBloc> blocs;
  final String title;

  // ignore: sort_constructors_first
  const PageContainer({this.appBar, this.child, this.blocs, this.title});
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: blocs.map((e) => Provider.value(value: e)).toList(),
      child: Scaffold(
          appBar:appBar??EmptyAppbar(),
          body: SafeArea(child: child),
        ),
    );

  }
}


