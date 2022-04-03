import 'package:flutter/material.dart';
import 'package:paycode/core/components/textfield/text_field.dart';
import 'package:paycode/core/constants/colors.dart';
import 'package:paycode/core/constants/size.dart';
import 'package:paycode/core/extensions/size_extension.dart';
import 'package:paycode/core/funcs/toast_message.dart';
import 'package:paycode/core/init/theme/theme_notifier.dart';
import 'package:paycode/view/authenticate/login/viewmodel/login_viewmodel.dart';
import 'package:paycode/view/authenticate/register/model/register_model.dart';
import 'package:paycode/view/authenticate/register/viewmodel/register_viewmodel.dart';
import 'package:paycode/view/main/profile/viewmodel/profile_viewmodel.dart';
import 'package:paycode/view/order/view/order_view.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeNotifier>(context).customTheme;
    final _profileViewModel = Provider.of<ProfileViewModel>(context);
    final _loginViewModel = Provider.of<LoginViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: context.mediumPadding,
          child: Text(
            "Profil",
            style: theme!.themeData!.textTheme.headline6,
            maxLines: 1,
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              Padding(
                padding: context.minimumPadding,
                child: Container(
                  width: context.getWidth,
                  height: context.getHeight * 0.21,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset:
                            const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Padding(
                    padding: context.minimumPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 35,
                          child: Text(
                            _loginViewModel.registerFirestoreModel.name!
                                .substring(0, 1),
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        SizedBox(
                          height: context.getHeight * 0.01,
                        ),
                        Text(
                          _loginViewModel.registerFirestoreModel.name! +
                              " " +
                              _loginViewModel.registerFirestoreModel.surname!,
                          style: theme.themeData!.textTheme.headline6,
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: context.getHeight * 0.01,
                        ),
                        Divider(
                          height: 1,
                        ),
                        SizedBox(
                          height: context.getHeight * 0.01,
                        ),
                        Expanded(
                          child: Text(
                            _loginViewModel.registerFirestoreModel.email!,
                            style: theme.themeData!.textTheme.headline4,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _profileViewModel.resetPassword(
                      email: _loginViewModel.loginModel!.email);
                  ToastMessage.show(
                      title:
                          "Şifre sıfırlama linki mail adresinize gönderildi!");
                },
                child: Padding(
                  padding: context.minimumPadding,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          5,
                        ),
                      ),
                    ),
                    child: Padding(
                        padding: context.mediumPadding,
                        child: Row(
                          children: [
                            Icon(
                              Icons.lock,
                              color: ConstantColors.bottomBarGreenIconColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Şifreni Güncelle",
                              style: theme.themeData!.textTheme.headline4,
                            ),
                          ],
                        )),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OrderView()));
                },
                child: Padding(
                  padding: context.minimumPadding,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          5,
                        ),
                      ),
                    ),
                    child: Padding(
                        padding: context.mediumPadding,
                        child: Row(
                          children: [
                            Icon(
                              Icons.history,
                              color: ConstantColors.bottomBarGreenIconColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Geçmiş Siparişlerim",
                              style: theme.themeData!.textTheme.headline4,
                            ),
                          ],
                        )),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _loginViewModel.signOut();
                },
                child: Padding(
                  padding: context.minimumPadding,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          5,
                        ),
                      ),
                    ),
                    child: Padding(
                        padding: context.mediumPadding,
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout,
                              color: ConstantColors.bottomBarGreenIconColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Çıkış Yap",
                              style: theme.themeData!.textTheme.headline4,
                            ),
                          ],
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
