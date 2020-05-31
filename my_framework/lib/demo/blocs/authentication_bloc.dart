import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_framework/demo/config/dependency_configr.dart';
import 'package:my_framework/demo/data/repository/authentication_repository.dart';
import 'package:my_framework/demo/events/signin/sign_in_event.dart';
import 'package:my_framework/demo/events/signin/sign_in_failed.dart';
import 'package:my_framework/demo/events/signin/sign_in_success_event.dart';
import 'package:my_framework/demo/shared/model/res_error_model.dart';
import 'package:my_framework/demo/shared/model/user_data_model.dart';
import 'package:my_framework/demo/utils/error_utils.dart';
import 'package:my_framework/demo/views/authen/sign_up/sign_up_page.dart';
import 'package:my_framework/demo/views/main/main_page.dart';
import 'package:rxdart/rxdart.dart';

import '../base/base_bloc.dart';
import '../base/base_event.dart';

class AuthenticationBloc extends BaseBloc  implements ISignInListener{
  AuthenticationRepository authenticationRepository = getIt<AuthenticationRepository>();

  @override
  void dispatchEvent(BaseEvent event) {
    switch (event.runtimeType) {
      case SignInEvent:
        _handelEventSignIn(event);
        break;
    }
  }


  _handelEventSignIn(SignInEvent event) {
    loadingSink.add(true);
    Future.delayed(Duration(seconds: 2), () {
      authenticationRepository.signIn(event.phone, event.pass, this);
    });
  }


  @override
  dispose() {
    print("dispose bloc");
    super.dispose();
  }


  @override
  onSignInFailed(error) {
    loadingSink.add(false);
    ErrorUtils().handleError(error);
  }


  @override
  onSignInSuccess(UserData userData) {
    loadingSink.add(false);
    Get.off(MainPage());
  }



}