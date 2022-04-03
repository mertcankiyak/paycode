import 'package:flutter/material.dart';
import 'package:paycode/locator.dart';
import 'package:paycode/view/authenticate/register/base/register_base.dart';
import 'package:paycode/view/authenticate/register/model/register_model.dart';
import 'package:paycode/view/authenticate/register/service/register_service.dart';

class RegisterViewModel with ChangeNotifier implements RegisterBASE {
  RegisterService _registerService = locator<RegisterService>();

  @override
  Future<RegisterFirestoreModel> signUpWithEmail(
      {required String email, required String password}) async {
    try {
      return await _registerService.signUpWithEmail(
          email: email, password: password);
    } catch (e) {
      throw "signUpWithEmail Hata: " + e.toString();
    }
  }

  @override
  Future<bool> firestoreAddUser({required RegisterFirestoreModel model}) async {
    try {
      return await _registerService.firestoreAddUser(model: model);
    } catch (e) {
      throw "firestoreAddUser Hata: " + e.toString();
    }
  }
}
