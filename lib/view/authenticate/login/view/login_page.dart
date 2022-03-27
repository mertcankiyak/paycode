import 'package:flutter/material.dart';
import 'package:paycode/core/components/buttons/buttons.dart';
import 'package:paycode/core/components/textfield/text_field.dart';
import 'package:paycode/core/constants/colors.dart';
import 'package:paycode/core/extensions/size_extension.dart';
import 'package:paycode/core/init/theme/theme_notifier.dart';
import 'package:paycode/core/utils/authenticate_validate.dart';
import 'package:paycode/view/authenticate/login/viewmodel/login_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with AuthenticateValidationMixin {
  GlobalKey<FormState> _formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final _theme = Provider.of<ThemeNotifier>(context).customTheme;
    final _authViewModel = Provider.of<LoginViewModel>(context);
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
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
                child: RoundedButton(
                  text: "Giriş Yap",
                  backgroundColor: ConstantColors.greenColor,
                  splashColor: ConstantColors.softGreen,
                  icon: Icon(
                    Icons.login_rounded,
                    color: ConstantColors.bodyColor,
                  ),
                  onTap: () async {
                    if (_formkey.currentState!.validate() == true) {
                      _formkey.currentState!.save();
                      await _authViewModel
                          .signInWithEmail(
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim())
                          .then((value) async {
                        await _authViewModel.girisYapmisKullaniciBilgileriniCek(
                            email: _emailController.text);
                      });
                    }
                  },
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
                  onTap: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                  },
                ),
              ),
              Padding(
                padding: context.minimumPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Şifremi unuttum",
                      style: _theme.themeData!.textTheme.bodyText2,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
