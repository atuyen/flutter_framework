import 'package:dio/dio.dart';
import 'package:my_framework/demo/constant/message_constant.dart';
import '../constant/status_code_constant.dart';
import '../shared/model/res_error_model.dart';
import 'dialog.dart';


class ErrorUtils {
//  static RestError handleError(DioError dioError) {
//    var errorMsg = MessageConstant.CONNECTION_ERROR;
//    if (dioError.response != null &&
//        dioError.response.statusCode ==
//            StatusCodeConstant.AUTHENTICATION_FAILED) {
//      errorMsg = MessageConstant.AUTHENTICATION_FAILED;
//    }
//    return RestError.fromData(errorMsg);
//  }


  void handleError(DioError error){
    String errorMSG = MessageConstant.CONNECTION_ERROR;
    if(error.response!=null && error.response.statusCode == StatusCodeConstant.AUTHENTICATION_FAILED){
      print(MessageConstant.AUTHENTICATION_FAILED);
    }
    DialogUtils.alert(errorMSG);
  }


  static String getErrorMsg(List<RestError> errors){
    String errorMsg = "";
    if(errors!=null){
      for(int i =0;i<errors.length;i++){
        errorMsg+=errors[i].message;
        if(i!=errors.length-1){
          errorMsg+="\n";
        }
      }
    }
    return errorMsg;
  }
}
