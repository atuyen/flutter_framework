

import 'package:my_framework/demo/base/base_bloc.dart';
import 'package:my_framework/demo/base/base_event.dart';
import 'package:rxdart/rxdart.dart';

class CommunicationService  {
  final appController = BehaviorSubject<BaseEvent>();

  Stream get globalStream => appController.stream;
  Sink get globalSink => appController.sink;




  void emit(BaseEvent data) {
    globalSink.add(data);
  }




  void dispose() {
    appController.close();
  }


}
