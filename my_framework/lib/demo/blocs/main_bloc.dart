import 'dart:math';

import 'package:my_framework/demo/base/base_bloc.dart';
import 'package:my_framework/demo/base/base_event.dart';
import 'package:my_framework/demo/config/dependency_configr.dart';
import 'package:my_framework/demo/data/repository/notification_repository.dart';
import 'package:my_framework/demo/events/get_notification_event.dart';
import 'package:my_framework/demo/events/loading_event.dart';
import 'package:my_framework/demo/events/select_tab_event.dart';
import 'package:my_framework/demo/events/signin/loaded_event.dart';
import 'package:rxdart/rxdart.dart';

class MainBloc extends BaseBloc implements IGetNotificationNumberListener{
  NotificationRepository _notificationRepository = getIt<NotificationRepository>();





  final _tabSelectedIndexStreamController = BehaviorSubject<int>();
  get tabSelectedIndexStream => _tabSelectedIndexStreamController.stream;

  final _notificationNumberStreamController = BehaviorSubject<int>();
  get notificationNumberStream => _notificationNumberStreamController.stream;


  @override
  void dispatchEvent(BaseEvent event) {
    switch (event.runtimeType) {
      case SelectTabEvent:
        _handleEventSelectTab(event);
        break;
      case GetNotificationEvent:
        _handleEventGetNotification();
        break;
    }
  }


  _handleEventSelectTab(SelectTabEvent event){
    _tabSelectedIndexStreamController.sink.add(event.tab);
  }

  _handleEventGetNotification(){
    processEventSink.add(LoadingEvent());
    _notificationRepository.getNotificationNumber(this);
  }
  
  giaLapThayDoiSoNumber(){
    _notificationNumberStreamController.sink.add(Random().nextInt(100));
  }





  @override
  onGetNotificationNumberFailed(errMsg) {
  }

  @override
  onGetNotificationNumberSuccess(int number) {
    _notificationNumberStreamController.sink.add(number);
    processEventSink.add(LoadedEvent());
  }
}