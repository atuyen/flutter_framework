import 'package:flutter/material.dart';
import '../../config/app_color_config.dart';


class BtnStyle {
  static TextStyle normal() {
    return TextStyle(fontSize: 17, color: AppColor.white);
  }

  static TextStyle normalWhite(Color color) {
    return TextStyle(fontSize: 17, color: color, fontWeight: FontWeight.w600);
  }
  static TextStyle smallTextWhite(Color color) {
    return TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.w600);
  }
}
