import 'package:paycode/view/authenticate/register/model/register_model.dart';

abstract class RegisterBASE {
  Future<RegisterFirestoreModel> signUpWithEmail(
      {required String email, required String password});
  Future<bool> firestoreAddUser({required RegisterFirestoreModel model});
}
