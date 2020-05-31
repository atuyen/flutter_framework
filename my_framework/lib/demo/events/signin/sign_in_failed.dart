

import 'package:my_framework/demo/base/base_event.dart';

class SignInFailedEvent extends BaseEvent{
  String msgError;
  SignInFailedEvent(this.msgError);
}