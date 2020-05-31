import 'package:my_framework/demo/base/base_bloc.dart';
import 'package:my_framework/demo/base/base_event.dart';
import 'package:my_framework/demo/events/loading_event.dart';
import 'package:my_framework/demo/events/signin/loaded_event.dart';

class Home1Bloc extends BaseBloc{



  demoShowLoading(){
    emitEvent(LoadingEvent());
  }
  demoCloseLoading(){
    emitEvent(LoadedEvent());
  }


  @override
  void search(textSearch) {
    print(" home 1 bloc search $textSearch");

  }

  @override
  void dispatchEvent(BaseEvent event) {

  }





}