import 'package:get_it/get_it.dart';
import 'package:my_framework/demo/blocs/conmunication_service.dart';
import 'package:my_framework/demo/blocs/authentication_bloc.dart';
import 'package:my_framework/demo/blocs/home1_bloc.dart';
import 'package:my_framework/demo/blocs/home2_bloc.dart';
import 'package:my_framework/demo/blocs/loading_bloc.dart';
import 'package:my_framework/demo/blocs/main_bloc.dart';
import 'package:my_framework/demo/blocs/sidebar_bloc.dart';
import 'package:my_framework/demo/data/remote/data_remote.dart';
import 'package:my_framework/demo/data/repository/authentication_repository.dart';
import 'package:my_framework/demo/data/repository/category_repository.dart';
import 'package:my_framework/demo/data/repository/notification_repository.dart';





GetIt getIt = GetIt.instance;
void setupLocator() {

    ///Register api service
    getIt.registerLazySingleton<DataRemote>(() => DataRemote());

    ///Register repository
    getIt.registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepository());
    getIt.registerLazySingleton<CategoryRepo>(() => CategoryRepo());
    getIt.registerLazySingleton<NotificationRepository>(() => NotificationRepository());



    /// register bloc
    getIt.registerLazySingleton<CommunicationService>(() => CommunicationService());
    getIt.registerLazySingleton<AuthenticationBloc>(() => AuthenticationBloc());
    getIt.registerLazySingleton<LoadingBloc>(() => LoadingBloc());


    getIt.registerLazySingleton<SidebarBloc>(() => SidebarBloc());
    getIt.registerLazySingleton<MainBloc>(() => MainBloc());
    getIt.registerLazySingleton<Home1Bloc>(() => Home1Bloc());
    getIt.registerLazySingleton<Home2Bloc>(() => Home2Bloc());
}