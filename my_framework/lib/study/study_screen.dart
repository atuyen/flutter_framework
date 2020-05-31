import 'package:flutter/material.dart';
import 'package:my_framework/study/app_lifecycle/app_life_cycle.dart';
import 'package:my_framework/study/bloc/demo_bloc.dart';
import 'package:my_framework/study/bloc_giao_tiep/main.dart';
import 'package:my_framework/study/demo_dependency_injection/demo_dependency_injection.dart';
import 'package:my_framework/study/demo_platform_chanel/demo_platform_chanel.dart';
import 'package:my_framework/study/furture/furture_app.dart';
import 'package:my_framework/study/hoc_key/hoc_key.dart';
import 'package:my_framework/study/isolate_demo/isolate_demo.dart';
import 'package:my_framework/study/navigation/hoc_navigator.dart';
import 'package:my_framework/study/provider/provider_widget.dart';
import 'package:my_framework/study/scop_model/scop_model.dart';
import 'package:my_framework/study/stream/stream_app.dart';
import 'study_ui/ui_lv1.dart';
import 'package:my_framework/study/widget_lifecycle/did_change_dependency/DemoDidChangeDependencies.dart';
import 'package:my_framework/study/widget_lifecycle/did_update_widget/did_update_widget.dart';
import 'inherited_widget/inherited_widget.dart';
import 'study_ui_lv2/ui_lv2.dart';
import 'study_ui_lv3/ui_lv3.dart';
import 'toi_uu_rebuild_widget/toi_uu_rebuild_widget.dart';






class StudyScreen extends StatefulWidget {
  @override
  _StudyScreenState createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.red,
        child: Text("Back"),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            _item("UI L1",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>UILevel1()))),
            _item("UI L2",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>UILevel2()))),
            _item("UI L3",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>UILevel3()))),
            _item("Navigator",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>HocNavigator()))),
            _item("Test Rebuil childrent",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>DemoUseConst()))),
            _item("Did update life cicle",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>DidUpdateApp()))),
            _item("Did change dependenncy",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>Demo3()))),
            _item("App life cycle",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>AppLifeCycle()))),
            _item("Furture",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>FurtureApp()))),
            _item("Stream",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>StreamApp()))),
            _item("Hoc Key",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>HocKey()))),
            _item("Inherited Widget",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>InheritedExample()))),
            _item("Scop model",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>ScopedModelExample()))),
            _item("Provider",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>ProviderExample()))),
            _item("Demo bloc",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>DemoBloc()))),
            _item("Demo giao tiep bloc",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>GiaoTiepBloc()))),
            _item("Demo dependency injection",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>DemoDependencyInjection()))),

            _item("Isolate demo",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>IsolateDemo()))),
            _item("Platform channel demo",()=>  Navigator.push(context, MaterialPageRoute(builder: (_)=>DemoPlatformChanel()))),
          ],
        ),
      ),
    );
  }

  Widget _item(text,callBack){
    return Column(
      children: <Widget>[
        InkWell(
          onTap: (){
            callBack();
          },
          child: Text(text),
        ),
        SizedBox(height: 10,),
      ],
    );

  }

}
