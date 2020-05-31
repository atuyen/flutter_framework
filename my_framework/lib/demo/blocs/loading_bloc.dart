import 'package:my_framework/demo/base/base_bloc.dart';
import 'package:my_framework/demo/base/base_event.dart';
import 'package:my_framework/demo/events/loading_event.dart';
import 'package:my_framework/demo/events/signin/loaded_event.dart';
import 'package:rxdart/rxdart.dart';

class LoadingBloc extends BaseBloc {
  int loadingValue=0;

  Subject<int> _loadingValueStreamController = BehaviorSubject<int>();
  Stream<int> get loadingValueStream => _loadingValueStreamController.stream;
  




  @override
  void dispatchEvent(BaseEvent event) {
    print("event");
    switch (event.runtimeType) {
      case LoadingEvent:
        _loadingValueStreamController.sink.add(++loadingValue);
        break;
      case LoadedEvent:
        _loadingValueStreamController.sink.add(--loadingValue);
        break;
    }
  }

}