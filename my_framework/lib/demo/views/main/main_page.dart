import 'package:flutter/material.dart';
import 'package:my_framework/demo/blocs/authentication_bloc.dart';
import 'package:my_framework/demo/blocs/main_bloc.dart';
import 'package:my_framework/demo/blocs/sidebar_bloc.dart';
import 'package:my_framework/demo/config/dependency_configr.dart';
import 'package:my_framework/demo/events/get_categories_event.dart';
import 'package:my_framework/demo/events/get_notification_event.dart';
import 'package:my_framework/demo/events/select_tab_event.dart';
import 'package:my_framework/demo/views/business/business_navigator.dart';
import 'package:my_framework/demo/views/home/home_navigator.dart';
import 'package:my_framework/demo/views/main/drawer_page.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> mainKey = new GlobalKey<ScaffoldState>();
  AuthenticationBloc authenticationBloc = getIt<AuthenticationBloc>();
  SidebarBloc sidebarBloc = getIt<SidebarBloc>();
  MainBloc mainBloc = getIt<MainBloc>();

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = [];
  void _onItemTapped(int index) {
    mainBloc.processEventSink.add(SelectTabEvent(index));
  }

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      HomeNavigator(),
      BusinessNavigator(),
      Text(
        'Index 2: School',
        style: optionStyle,
      ),
    ];

    sidebarBloc.processEventSink.add(GetCategoryEvent());
    mainBloc.processEventSink.add(GetNotificationEvent());

  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: mainKey),
        Provider.value(value: authenticationBloc),
        Provider.value(value: sidebarBloc),
        Provider.value(value: mainBloc)

      ],
      child: Scaffold(
          key: mainKey,
          body: StreamProvider<int>.value(
              value: mainBloc.tabSelectedIndexStream,
              initialData: 0,
            child: Consumer<int>(
              builder: (context,tab,child)=>_widgetOptions.elementAt(tab),
            ),
           ),
          drawer: DrawerPage(),
          bottomNavigationBar: StreamProvider<int>.value(
            value: mainBloc.tabSelectedIndexStream,
            initialData: 0,
            child:Consumer<int>(
              builder: (context,tab,child)=>BottomNavigationBar(
                items:  <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    title: Text('Home'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.business),
                    title: Text('Business'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.school),
                    title: Text('School'),
                  ),
                ],
                currentIndex: tab,
                selectedItemColor: Colors.amber[800],
                onTap: _onItemTapped,
              ),
            )
          ),
        ),
    );
  }
}


