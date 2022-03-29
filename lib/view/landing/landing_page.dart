import 'package:flutter/material.dart';
import 'package:paycode/view/authenticate/login/view/login_page.dart';
import 'package:paycode/view/authenticate/login/viewmodel/login_viewmodel.dart';
import 'package:paycode/view/main/home/view/bottom_navigation.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final _authViewModel = Provider.of<LoginViewModel>(context);
    if (_authViewModel.authState == AuthState.BOSTA) {
      if (_authViewModel.loginModel!.email == null) {
        return LoginPage();
      } else {
        return BottomNavigation();
      }
    } else {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
  }
}
