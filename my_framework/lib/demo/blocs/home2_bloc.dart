import 'package:my_framework/demo/base/base_bloc.dart';
import 'package:my_framework/demo/base/base_event.dart';

class Home2Bloc extends BaseBloc{

  @override
  void search(textSearch) {
    print(" home 2 bloc search $textSearch");
  }


  @override
  void dispatchEvent(BaseEvent event) {
    // TODO: implement dispatchEvent
  }

}