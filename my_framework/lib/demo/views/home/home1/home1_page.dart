import 'package:flutter/material.dart';
import 'package:my_framework/demo/base/base_widget.dart';
import 'package:my_framework/demo/blocs/home1_bloc.dart';
import 'package:my_framework/demo/blocs/loading_bloc.dart';
import 'package:my_framework/demo/config/dependency_configr.dart';
import 'package:my_framework/demo/events/loading_event.dart';
import 'package:my_framework/demo/shared/widget/custom_appbar_widget.dart';
import 'package:my_framework/demo/shared/widget/loading_task_demo.dart';
import 'package:my_framework/demo/shared/widget/notification_widget.dart';
import 'package:my_framework/demo/shared/widget/search_widget.dart';
import 'package:my_framework/demo/utils/dialog.dart';
import 'package:my_framework/demo/views/home/home2/home2_page.dart';
import 'package:provider/provider.dart';




class Home1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageContainer(
      blocs: [
        getIt<Home1Bloc>()
      ],
      appBar: CustomAppbar(
        title: "home 1",
        actions: [
          NotificationWidget(),
          Icon(
            Icons.map,
            color: Colors.red,
          ),
        ],
        showButtonOpenDrawer: true,
        searchWidget: SearchWidget(
          bloc: getIt<Home1Bloc>(),
        ),
      ),
      child: Home1PageContainer()
    );
  }
}


class Home1PageContainer extends StatefulWidget {
  @override
  _Home1PageContainerState createState() => _Home1PageContainerState();
}

class _Home1PageContainerState extends State<Home1PageContainer> {
  Home1Bloc home1bloc = getIt<Home1Bloc>();
  LoadingBloc loadingBloc = getIt<LoadingBloc>();

  @override
  Widget build(BuildContext context) {

    return LoadingTaskDemo(
      child: Center(
        child: Column(
          children: [
            Text("home 1"),
            SizedBox(height: 20,),
            RaisedButton(
              child: Text("Sang Home 2"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>Home2Page()));
              },
            ),
            SizedBox(height: 20,),
            RaisedButton(
              child: Text("demo show loading"),
              onPressed: (){
                  home1bloc.demoShowLoading();
              },
            ),
            SizedBox(height: 20,),
            RaisedButton(
              child: Text("demo tat loading"),
              onPressed: (){
                home1bloc.demoCloseLoading();
              },
            ),

            SizedBox(height: 20,),
            RaisedButton(
              child: Text("demo show alert 1"),
              onPressed: (){
                DialogUtils.alert("xin chao ");
                DialogUtils.alert("xin chao 2");
              },
            ),
            SizedBox(height: 20,),
            RaisedButton(
              child: Text("demo show arler 2"),
              onPressed: (){
                DialogUtils.alert("xin chao 2");
              },
            )

          ],

        ),
      ),
    );
  }
}

