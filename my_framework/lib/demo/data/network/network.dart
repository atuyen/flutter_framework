
import 'package:dio/dio.dart';
import 'package:my_framework/demo/constant/spref_constant.dart';
import '../../constant/api_constant.dart';
import '../../utils/shared_preferences_utils.dart';



class BookClient {
  static BaseOptions _options = new BaseOptions(
    baseUrl: APIConstant.BASE_URL,
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  static Dio _dio = Dio(_options);

  BookClient._internal() {
//    _dio.interceptors.add(LogInterceptor(responseBody: true));
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (Options myOption) async {
      var token = SharedPreferencesUtils.getString(SPrefCacheConstant.KEY_TOKEN);
      if (token != null) {
        myOption.headers["Authorization"] = "Bearer " + token;
      }
      return myOption;
    }));
  }
  static final BookClient instance = BookClient._internal();

  Dio get dio => _dio;
}