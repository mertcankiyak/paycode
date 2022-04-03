import 'package:flutter/material.dart';
import 'package:paycode/core/constants/colors.dart';
import 'package:paycode/core/components/buttons/buttons.dart';
import 'package:paycode/core/components/textfield/text_field.dart';
import 'package:paycode/core/constants/colors.dart';
import 'package:paycode/core/extensions/size_extension.dart';
import 'package:paycode/core/init/theme/theme_notifier.dart';
import 'package:paycode/core/utils/authenticate_validate.dart';
import 'package:paycode/view/authenticate/login/viewmodel/login_viewmodel.dart';
import 'package:paycode/view/authenticate/register/model/register_model.dart';
import 'package:paycode/view/authenticate/register/viewmodel/register_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView>
    with AuthenticateValidationMixin {
  GlobalKey<FormState> _formkey = GlobalKey();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _rePasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _theme = Provider.of<ThemeNotifier>(context).customTheme;
    final _loginViewModel = Provider.of<LoginViewModel>(context);
    final _registerViewModel = Provider.of<RegisterViewModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ConstantColors.bodyColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ConstantColors.bodyColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Shimmer.fromColors(
                period: Duration(seconds: 5),
                baseColor: Colors.green,
                highlightColor: Colors.greenAccent,
                child: Text('payCode',
                    textAlign: TextAlign.center,
                    style: _theme!.themeData!.textTheme.headline1),
              ),
              Text(
                "Hızlı Alışveriş",
                style: _theme.themeData!.textTheme.headline6,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: context.minimumPadding,
                child: RadiusTextFormField(
                  hintText: "Email",
                  icon: Icon(Icons.email_outlined),
                  textEditingController: _emailController,
                  validator: validateEmail,
                ),
              ),
              Padding(
                padding: context.minimumPadding,
                child: RadiusTextFormField(
                  hintText: "Şifre",
                  icon: Icon(Icons.password),
                  textEditingController: _passwordController,
                  validator: validatePassword,
                  obsecureText: true,
                ),
              ),
              Padding(
                padding: context.minimumPadding,
                child: RadiusTextFormField(
                  hintText: "Şifre Tekrar",
                  icon: Icon(Icons.password),
                  textEditingController: _rePasswordController,
                  validator: (value) {
                    if (value!.length > 5) {
                      if (_passwordController.text !=
                          _rePasswordController.text) {
                        return "Şifreler Uyuşmuyor";
                      } else {
                        return null;
                      }
                    } else {
                      return "Şifreniz 6 karakterden az olamaz";
                    }
                  },
                  obsecureText: true,
                ),
              ),
              Padding(
                padding: context.minimumPadding,
                child: RadiusTextFormField(
                  hintText: "İsim",
                  icon: Icon(Icons.password),
                  textEditingController: _nameController,
                  validator: lengthControl,
                  obsecureText: false,
                ),
              ),
              Padding(
                padding: context.minimumPadding,
                child: RadiusTextFormField(
                  hintText: "Soyisim",
                  icon: Icon(Icons.password),
                  textEditingController: _surnameController,
                  validator: lengthControl,
                  obsecureText: false,
                ),
              ),
              Padding(
                padding: context.minimumPadding,
                child: RoundedButton(
                  text: "Kayıt Ol",
                  backgroundColor: ConstantColors.orangeColor,
                  splashColor: ConstantColors.darkGreen,
                  icon: Icon(
                    Icons.email,
                    color: ConstantColors.bodyColor,
                  ),
                  onTap: () async {
                    if (_formkey.currentState!.validate() == true) {
                      _formkey.currentState!.save();
                      await _registerViewModel
                          .signUpWithEmail(
                              email: _emailController.text,
                              password: _rePasswordController.text)
                          .then((value) async {
                        await _loginViewModel.currentUser().then((value) async {
                          RegisterFirestoreModel _eklenecekKullaniciModel =
                              RegisterFirestoreModel(
                                  name: _nameController.text,
                                  surname: _surnameController.text,
                                  email: _emailController.text,
                                  id: value.id);
                          await _registerViewModel
                              .firestoreAddUser(model: _eklenecekKullaniciModel)
                              .then((value) {
                            Navigator.pop(context);
                          });
                        });
                      });
                      await _loginViewModel.girisYapmisKullaniciBilgileriniCek(
                          email: _emailController.text);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
