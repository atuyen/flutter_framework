import 'dart:math';

import 'package:my_framework/demo/config/dependency_configr.dart';
import 'package:my_framework/demo/constant/api_constant.dart';
import 'package:my_framework/demo/data/remote/data_remote.dart';
import 'package:my_framework/demo/shared/model/category.dart';

abstract class ICategoriesListener {
  getCategorySuccess(List<Category> categories);
  getCategoryFailed();
}


class CategoryRepo {
  DataRemote _dataRemote = getIt<DataRemote>();

  void getCategories(ICategoriesListener listener) async {
    _dataRemote.get(APIConstant.GET_CATEGORY)
    .then((res) {
      var data = Category.listFromJson(res.data["value"]);
      print(data.toString());
      listener.getCategorySuccess(data);
    }).catchError((error){
      listener.getCategoryFailed();
    });
  }


}
