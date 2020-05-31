import 'package:flutter/material.dart';
import 'package:my_framework/demo/base/base_bloc.dart';
import 'package:my_framework/demo/blocs/loading_bloc.dart';
import 'package:my_framework/demo/config/dependency_configr.dart';
import 'package:provider/provider.dart';

class LoadingTaskDemo extends StatelessWidget {
  final Widget child;


  final LoadingBloc loadingBloc = getIt<LoadingBloc>();
  LoadingTaskDemo({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return StreamProvider<int>.value(
      value: loadingBloc.loadingValueStream,
      initialData: 0,
      child: Stack(
        children: <Widget>[
          child,
          Consumer<int>(
            builder: (context, loadingValue, child) => Center(
              child: (loadingValue>0)
                  ? new Container(
                width: 70.0,
                height: 70.0,
                child: new Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: new Center(
                        child: new CircularProgressIndicator())),
              )
                  : Container(),
            ),
          ),
        ],
      ),
    );
  }
}
