import 'package:paycode/view/authenticate/login/base/login_base.dart';
import 'package:paycode/view/authenticate/login/model/login_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:paycode/view/authenticate/register/model/register_model.dart';

class LoginService implements LoginBASE {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<LoginModel> signInWithEmail(
      {required String email, required String password}) async {
    LoginModel girisYapanKullanici = LoginModel();
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    girisYapanKullanici.email = userCredential.user!.email;
    girisYapanKullanici.id = userCredential.user!.uid;
    return girisYapanKullanici;
  }

  @override
  Future<LoginModel> currentUser() async {
    if (_firebaseAuth.currentUser != null) {
      User? user = _firebaseAuth.currentUser;
      LoginModel? girisYapanKullanici =
          LoginModel(email: user!.email, id: user.uid);
      return girisYapanKullanici;
    } else {
      return LoginModel(email: null, id: null);
    }
  }

  @override
  Future<LoginModel> signOut() async {
    await _firebaseAuth.signOut();
    return LoginModel(email: null, id: null);
  }

  @override
  Future<RegisterFirestoreModel> girisYapmisKullaniciBilgileriniCek(
      {required String email}) async {
    QuerySnapshot<Map<String, dynamic>> kullaniciSorgu =
        await _firebaseFirestore
            .collection("kullanicilar")
            .where("kullanici_email", isEqualTo: email)
            .get();
    return RegisterFirestoreModel.fromMap(kullaniciSorgu.docs[0].data());
  }
}
