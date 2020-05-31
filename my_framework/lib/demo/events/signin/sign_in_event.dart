
import 'package:my_framework/demo/base/base_event.dart';

class SignInEvent extends BaseEvent{
  String phone;
  String pass;
  SignInEvent({this.phone,this.pass});
}