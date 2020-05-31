import 'package:get_it/get_it.dart';
import 'package:my_framework/study/demo_dependency_injection/bank_service.dart';
import 'package:my_framework/study/demo_dependency_injection/vietcom_bank.dart';



GetIt getIt = GetIt.instance;
void setupLocator() {
//  getIt.registerFactory<BankService>(() => VietcomBank());
    getIt.registerLazySingleton<BankService>(() => VietcomBank());

}