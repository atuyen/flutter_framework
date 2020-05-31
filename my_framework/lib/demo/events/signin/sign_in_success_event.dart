

import 'package:my_framework/demo/base/base_event.dart';
import 'package:my_framework/demo/shared/model/user_data_model.dart';

class SignInSuccessEvent extends BaseEvent{
  UserData userData;
  SignInSuccessEvent(this.userData);
}