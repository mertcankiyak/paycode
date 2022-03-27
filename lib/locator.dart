import 'package:get_it/get_it.dart';
import 'package:paycode/view/authenticate/login/service/login_service.dart';

GetIt locator = GetIt.asNewInstance();

setupLocator() {
  locator.registerLazySingleton(() => LoginService());
}
