import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_framework/demo/shared/widget/my_padding.dart';

class DialogUtils {
  static bool isShowAlert=false;

  ///Show alert
  static void alert(String message) {
    if(isShowAlert){
      return;
    }
    alertWithCallback(message, null);
  }

  static void alertWithCallback(String message, Function callback) {
    isShowAlert = true;
    Get.dialog(AlertDialog(
        contentPadding: EdgeInsets.only(left: 5.0, right: 5.0),
        backgroundColor: Colors.transparent,
        content: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.all(
                Radius.circular(13.0),
              )),
          width: 50.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              MyPadding(
                paddingTop: 20.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text(
                  message,
                  style: TextStyle(
                      height: 1.1,
                      fontSize: 13.0,
                      color: Color.fromRGBO(138, 138, 138, 1)),
                  textAlign: TextAlign.center,
                ),
              ),
              MyPadding(
                paddingTop: 22.0,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: Get.theme.disabledColor, width: 0.5)),
                ),
                height: 47,
                child: InkWell(
                  onTap: () {
                    Get.back();
                    if (callback != null) {
                      callback();
                    }
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        "OK",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(21, 126, 251, 1)),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ))).then((value) => isShowAlert=false);
  }

  static void confirmWithCallback(BuildContext context, String message,
      Function callback, String cancelText, String acceptText, String label) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              contentPadding: EdgeInsets.only(left: 5.0, right: 5.0),
              backgroundColor: Colors.transparent,
              content: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: new BorderRadius.all(
                      Radius.circular(13.0),
                    )),
                width: 50.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    MyPadding(
                      paddingTop: 20.0,
                    ),
                    Text(
                      label,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w700),
                    ),
                    MyPadding(
                      paddingTop: 5.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Text(
                        message,
                        style: TextStyle(
                            height: 1.1,
                            fontSize: 13.0,
                            color: Color.fromRGBO(138, 138, 138, 1)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    MyPadding(
                      paddingTop: 22.0,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: Theme.of(context).disabledColor,
                                  width: 0.5)),
                        ),
                        height: 47,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Flexible(
                                flex: 1,
                                child: FlatButton(
                                  child: Center(
                                    child: Text(
                                      cancelText,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color:
                                              Color.fromRGBO(21, 126, 251, 1)),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              Container(
                                color: Theme.of(context).disabledColor,
                                width: 0.5,
                              ),
                              Flexible(
                                flex: 1,
                                child: Center(
                                    child: FlatButton(
                                  child: Center(
                                    child: Text(acceptText,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color.fromRGBO(
                                                21, 126, 251, 1))),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);

                                    if (callback != null) {
                                      callback();
                                    }
                                  },
                                )),
                              ),
                            ]))
                  ],
                ),
              ));
        });
  }

  //Show indicator
  static void indicator(BuildContext context, String message) {
    var simDialog = new SimpleDialog(
      title: new Text(message),
      children: <Widget>[new CircularProgressIndicator()],
      contentPadding: const EdgeInsets.all(8.0),
    );
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return simDialog;
        });
  }

  static Widget basicIndicator(bool show) {
    return show
        ? new Container(
            width: 70.0,
            height: 70.0,
            child: new Padding(
                padding: const EdgeInsets.all(5.0),
                child: new Center(child: new CircularProgressIndicator())),
          )
        : new Container();
  }

  static void showSnackBar(BuildContext context, String message) {
    SnackBar snackBar = new SnackBar(content: new Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  static void hideSnackBar(BuildContext context) {
    Scaffold.of(context).hideCurrentSnackBar();
  }
}
