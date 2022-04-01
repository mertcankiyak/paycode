import 'package:get_it/get_it.dart';
import 'package:paycode/view/authenticate/login/service/login_service.dart';
import 'package:paycode/view/main/campaign/service/campaign_service.dart';
import 'package:paycode/view/main/home/services/product_service.dart';

GetIt locator = GetIt.asNewInstance();

setupLocator() {
  locator.registerLazySingleton(() => LoginService());
  locator.registerLazySingleton(() => ProductService());
  locator.registerLazySingleton(() => CampaignService());
}
