
import 'package:flutter/material.dart';


class MyPrimaryButton extends StatelessWidget {
  final String label;
  final Function action;
  MyPrimaryButton({this.label, this.action});

  @override
  Widget build(BuildContext context) {
    return MyButton(
      label: label,
      action: action,
      color: Theme.of(context).primaryColor,
      colorText: Colors.white,
    );
  }
}

class MyDeleteButton extends StatelessWidget {
  final String label;
  final Function action;
  MyDeleteButton({this.label, this.action});

  @override
  Widget build(BuildContext context) {
    return MyButton(
      label: label,
      action: action,
      color: Colors.blue,
      colorText: Colors.red,
    );
  }
}


class MyCloseButton extends StatelessWidget {
  final String label;
  final Function action;
  MyCloseButton({this.label, this.action});

  @override
  Widget build(BuildContext context) {
    return MyButton(
      label: label,
      action: action,
      color: Theme.of(context).primaryColorLight,
      height: 40.0,
      colorText:  Theme.of(context).primaryColor,
    );
  }
}



class MyButton extends StatelessWidget {
  final String label;
  final Function action;
  final Color color;
  final double height;
  final Color colorText;
  MyButton({this.label, this.action, this.color,this.height,this.colorText});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(6.0),
          side: BorderSide(color: color)),
      onPressed: () {
        if (action != null) {
          action();
        }
      },
      color: color,
      textColor: Colors.white,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height:height!=null?height: 48.0,
        child: Center(
          child: Text(
            label.toUpperCase(),
            style: TextStyle(
              color: colorText,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
