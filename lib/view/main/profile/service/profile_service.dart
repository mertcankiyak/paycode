import 'package:paycode/view/main/profile/base/profile_base.dart';

import 'package:firebase_auth/firebase_auth.dart';

class ProfileService implements ProfileBASE {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> resetPassword({String? email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email!);
  }
}
