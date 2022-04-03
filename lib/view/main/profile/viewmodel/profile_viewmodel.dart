import 'package:flutter/material.dart';
import 'package:paycode/locator.dart';
import 'package:paycode/view/main/profile/base/profile_base.dart';
import 'package:paycode/view/main/profile/service/profile_service.dart';

class ProfileViewModel with ChangeNotifier implements ProfileBASE {
  ProfileService _profileService = locator<ProfileService>();

  @override
  Future<void> resetPassword({String? email}) async {
    try {
      await _profileService.resetPassword(email: email);
    } catch (e) {
      throw "Profile ViewModel Error:" + e.toString();
    }
  }
}
