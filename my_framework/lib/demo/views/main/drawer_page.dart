import 'package:flutter/material.dart';
import 'package:my_framework/demo/blocs/main_bloc.dart';
import 'package:my_framework/demo/blocs/sidebar_bloc.dart';
import 'package:my_framework/demo/constant/spref_constant.dart';
import 'package:my_framework/demo/events/select_tab_event.dart';
import 'package:my_framework/demo/shared/model/category.dart';
import 'package:my_framework/demo/shared/model/user_data_model.dart';
import 'package:my_framework/demo/utils/shared_preferences_utils.dart';
import 'package:my_framework/demo/views/home/home_navigator.dart';
import 'package:provider/provider.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {

//  UserData userData = UserData.fromJson(SharedPreferencesUtils.getObject(SPrefCacheConstant.KEY_USER));
  UserData userData = UserData(token: "123345");
  SidebarBloc sidebarBloc;
  MainBloc mainBloc;

  @override
  void initState() {
    super.initState();
    print("init drawer");

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    sidebarBloc = Provider.of(context);
    mainBloc = Provider.of(context);
  }

  @override
  void dispose() {
    print("dispose");
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {

    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(userData.token),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
         StreamProvider<List<Category>>.value(
             value: sidebarBloc.categoriesStream,
           initialData: [],
           child: Consumer<List<Category>>(
             builder: (context,categories,child){
               return Column(
                 children: categories.map((e) => Text(e.name)).toList()
               );
             },
           ),

         ),
          SizedBox(height: 20,),
          RaisedButton(
            child: Text("navigate to home 1"),
            onPressed: (){
              mainBloc.processEventSink.add(SelectTabEvent(0));
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 20,),
          RaisedButton(
            child: Text("navigate to businies 1"),
            onPressed: (){
              mainBloc.processEventSink.add(SelectTabEvent(1));
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
