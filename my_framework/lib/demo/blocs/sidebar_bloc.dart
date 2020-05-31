
import 'package:my_framework/demo/base/base_bloc.dart';
import 'package:my_framework/demo/base/base_event.dart';
import 'package:my_framework/demo/config/dependency_configr.dart';
import 'package:my_framework/demo/data/repository/category_repository.dart';
import 'package:my_framework/demo/events/get_categories_event.dart';
import 'package:my_framework/demo/shared/model/category.dart';
import 'package:rxdart/rxdart.dart';

class SidebarBloc extends BaseBloc
    implements ICategoriesListener {

  CategoryRepo categoryRepo = getIt<CategoryRepo>();

  final categoriesStreamController = BehaviorSubject<List<Category>>();
  get categoriesStream => categoriesStreamController.stream;



  @override
  void dispatchEvent(BaseEvent event) {
    switch (event.runtimeType) {
      case GetCategoryEvent:
        categoryRepo.getCategories(this);
        break;

    }
  }

  @override
  getCategoryFailed() {

  }

  @override
  getCategorySuccess(List<Category> categories) {
    categoriesStreamController.sink.add(categories);
  }


  @override
  void dispose() {
    categoriesStreamController.close();
    super.dispose();
  }

}
