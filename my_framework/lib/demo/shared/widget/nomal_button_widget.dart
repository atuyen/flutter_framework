import 'package:flutter/material.dart';

import '../../config/app_color_config.dart';
import '../style/btn_style.dart';


class NormalButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Color color;
  final Color backgroundColor;
  NormalButton(
      {@required this.onPressed,
      @required this.title,
      this.color,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 200,
      height: 40,
      child: RaisedButton(
        padding: EdgeInsets.only(top: 3),
        onPressed: onPressed,
        color: backgroundColor ?? AppColor.yellow,
        disabledColor: Colors.grey,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(4.0)),
        child: Text(
          title,
          style: BtnStyle.normalWhite(color ?? AppColor.blueMain),
        ),
      ),
    );
  }
}


class SimpleButton extends StatelessWidget {

  final VoidCallback onPressed;
  final String title;
  final Color color;
  final Color backgroundColor;
  SimpleButton(
      {@required this.onPressed,
        @required this.title,
        this.color,
        this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      child: RaisedButton(
        padding: EdgeInsets.only(top: 3),
        onPressed: onPressed,
        color: backgroundColor ?? AppColor.blueMain,
        disabledColor: Colors.grey,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(4.0)),
        child: Text(
          title,
          style: BtnStyle.normalWhite(color ?? AppColor.white),
        ),
      ),
    );
  }

}
