import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paycode/core/constants/colors.dart';
import 'package:paycode/core/init/theme/theme_notifier.dart';
import 'package:paycode/core/utils/globals.dart';
import 'package:paycode/locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:paycode/view/authenticate/login/viewmodel/login_viewmodel.dart';
import 'package:paycode/view/landing/landing_page.dart';
import 'package:paycode/view/main/basket/viewmodel/basket_viewmodel.dart';
import 'package:paycode/view/main/campaign/viewmodel/campaign_viewmodel.dart';
import 'package:paycode/view/main/home/viewmodel/product_viewmodel.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: ConstantColors.blackColor, // navigation bar color
    statusBarColor: ConstantColors.bodyColor, // status bar color
    statusBarBrightness: Brightness.light, //status bar brigtness
    statusBarIconBrightness: Brightness.dark, //status barIcon Brightness
    systemNavigationBarIconBrightness: Brightness.light, //navigation bar icon
  ));
  await Firebase.initializeApp();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeNotifier>(
          create: (context) => ThemeNotifier(lightTheme),
        ),
        ChangeNotifierProvider<LoginViewModel>(
          create: (context) => LoginViewModel(),
        ),
        ChangeNotifierProvider<ProductViewModel>(
          create: (context) => ProductViewModel(),
        ),
        ChangeNotifierProvider<BasketViewModel>(
          create: (context) => BasketViewModel(),
        ),
        ChangeNotifierProvider<CampaignViewModel>(
          create: (context) => CampaignViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PayCode',
        theme: ThemeData(
          primarySwatch: Colors.green,
          primaryColor: ConstantColors.greenColor,
        ),
        home: LandingPage(),
      ),
    );
  }
}
