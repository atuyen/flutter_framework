import 'package:flutter/material.dart';
import 'package:my_framework/demo/base/base_widget.dart';
import 'package:my_framework/demo/blocs/home2_bloc.dart';
import 'package:my_framework/demo/blocs/main_bloc.dart';
import 'package:my_framework/demo/config/dependency_configr.dart';
import 'package:my_framework/demo/shared/widget/custom_appbar_widget.dart';
import 'package:my_framework/demo/shared/widget/notification_widget.dart';
import 'package:my_framework/demo/shared/widget/search_widget.dart';
import 'package:provider/provider.dart';

class Home2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MainBloc mainBloc = Provider.of(context);
    return PageContainer(
      blocs: [
        getIt<Home2Bloc>()
      ],
      appBar: CustomAppbar(
        title: "home 2",
        actions: [
          NotificationWidget()
        ],
        showButtonOpenDrawer: false,
        searchWidget: SearchWidget(
          bloc: getIt<Home2Bloc>(),
        ),
      ),
      child: Center(
        child: Column(
          children: [
            Text("home 2"),
            SizedBox(height: 20,),
            RaisedButton(
              child: Text("Back ve home 1"),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 20,),
            RaisedButton(
              child: Text("Gia lap thay doi notification"),
              onPressed: (){
                mainBloc.giaLapThayDoiSoNumber();
              },
            )

          ],

        ),
      ),
    );
  }
}
