import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:my_framework/demo/blocs/conmunication_service.dart';
import 'package:my_framework/demo/config/dependency_configr.dart';
import 'package:my_framework/study/bloc_giao_tiep/base.dart';
import 'package:rxdart/rxdart.dart';

import 'base_event.dart';

abstract class BaseBloc{
  CommunicationService communicationService = getIt<CommunicationService>();


  Subject<BaseEvent> _processEventSubject = PublishSubject<BaseEvent>();
  Sink<BaseEvent> get processEventSink =>_processEventSubject.sink;
  Stream<BaseEvent> get processEventStream => _processEventSubject.stream;

  Subject<bool> _loadingStreamController = PublishSubject<bool>();
  Stream<bool> get loadingStream => _loadingStreamController.stream;
  Sink<bool> get loadingSink => _loadingStreamController.sink;


  void search(textSearch){

  }

  BaseBloc(){
    processEventStream.listen((event){
      dispatchEvent(event);
    });
   communicationService.globalStream.listen((event) {
      dispatchEvent(event);
    });
  }


  emitEvent(BaseEvent event){
    communicationService.globalSink.add(event);
  }


  void dispatchEvent(BaseEvent event);

  @mustCallSuper
  void dispose() {
    _processEventSubject.close();
    _loadingStreamController.close();
  }


}
