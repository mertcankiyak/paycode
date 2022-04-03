import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:paycode/view/authenticate/register/base/register_base.dart';
import 'package:paycode/view/authenticate/register/model/register_model.dart';

class RegisterService implements RegisterBASE {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<RegisterFirestoreModel> signUpWithEmail(
      {required String email, required String password}) async {
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    RegisterFirestoreModel kayitOlanKullanici = RegisterFirestoreModel(
        email: userCredential.user!.email, id: userCredential.user!.uid);
    return kayitOlanKullanici;
  }

  @override
  Future<bool> firestoreAddUser({required RegisterFirestoreModel model}) async {
    DocumentReference _documentReference =
        await _firebaseFirestore.collection("kullanicilar").add(model.toMap());
    if (_documentReference.id.length > 0) {
      return true;
    } else {
      return false;
    }
  }
}
