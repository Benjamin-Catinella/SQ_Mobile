import 'package:get_it/get_it.dart';
import 'package:sg_mobile/services/authentication_service.dart';
import 'package:sg_mobile/services/game_list_service.dart';

final getIt = GetIt.instance;

setupServiceLocator() {
  getIt.registerLazySingleton<AuthenticationService>(() => AuthenticationServiceImpl());
  getIt.registerLazySingleton<GameListService>(() => GameListServiceImpl());
}