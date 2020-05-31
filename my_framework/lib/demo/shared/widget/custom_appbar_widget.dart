

import 'package:flutter/material.dart';
import 'package:my_framework/demo/config/app_color_config.dart';
import 'package:my_framework/demo/shared/widget/search_widget.dart';
import 'package:my_framework/study/app_lifecycle/app_life_cycle.dart';
import 'package:provider/provider.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget{
  final bool showButtonOpenDrawer;
  final String title;
  final List<Widget> actions;
  final SearchWidget searchWidget;
  const CustomAppbar({Key key, this.showButtonOpenDrawer, this.title, this.actions, this. searchWidget}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> mainKey = Provider.of<GlobalKey<ScaffoldState>>(context);
    return AppBar(
      leading: _getLeading(mainKey,context),
//      title: Text(title),
      title: searchWidget,
      actions: actions,
    );
  }

  _getLeading(mainKey,context){
    if(showButtonOpenDrawer){
      return InkWell(
        child: Icon(Icons.menu),
        onTap: () {
          mainKey.currentState.openDrawer();
        },
      );
    }
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: AppColor.greyMain,
      ),
      onPressed: () => Navigator.pop(context, false),
    );
  }



  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(0, 50);
}
