

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_framework/demo/constant/message_constant.dart';
import 'package:my_framework/demo/constant/status_code_constant.dart';
import 'package:my_framework/demo/data/network/network.dart';
import 'package:my_framework/demo/utils/dialog.dart';

class DataRemote{

  Future<Response> post(String url,Object body) {
    return BookClient.instance.dio.post(
      url,
      data: body,
    );
  }


  Future<Response> get(String url){
    return BookClient.instance.dio.get(
      url
    );
  }


}