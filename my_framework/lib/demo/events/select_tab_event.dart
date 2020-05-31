import 'package:my_framework/demo/base/base_event.dart';

class SelectTabEvent extends BaseEvent {
  int tab;
  SelectTabEvent(this.tab);
}