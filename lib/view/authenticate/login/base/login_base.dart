import 'package:paycode/view/authenticate/login/model/login_model.dart';
import 'package:paycode/view/authenticate/register/model/register_model.dart';

abstract class LoginBASE {
  Future<LoginModel> signInWithEmail(
      {required String email, required String password});
  Future<RegisterFirestoreModel> girisYapmisKullaniciBilgileriniCek(
      {required String email});
  Future<LoginModel> currentUser();
  Future<LoginModel> signOut();
}
