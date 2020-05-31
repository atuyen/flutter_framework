import 'package:dio/dio.dart';
import 'package:my_framework/demo/config/dependency_configr.dart';
import 'package:my_framework/demo/constant/api_constant.dart';
import 'package:my_framework/demo/constant/spref_constant.dart';
import 'package:my_framework/demo/data/remote/data_remote.dart';
import 'package:my_framework/demo/utils/shared_preferences_utils.dart';
import '../../shared/model/res_error_model.dart';
import '../../shared/model/user_data_model.dart';

abstract class ISignInListener {
  onSignInSuccess(UserData userData);
  onSignInFailed(DioError error);
}



class AuthenticationRepository {
  DataRemote _dataRemote = getIt<DataRemote>();
  void signIn(String userName, String pass, ISignInListener signInListener) async {
    Object body = {
      'email': userName,
      'password': pass,
    };
    _dataRemote.post(APIConstant.SIGN_IN, body)
    .then((response){
      UserData userData = UserData.fromJson(response.data);
      SharedPreferencesUtils.putString(SPrefCacheConstant.KEY_TOKEN,userData.token);
      SharedPreferencesUtils.putObject(SPrefCacheConstant.KEY_USER, response.data);
      signInListener.onSignInSuccess(userData);
    })
    .catchError((error){
      signInListener.onSignInFailed(error);
    });
  }










}
