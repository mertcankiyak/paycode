import 'package:paycode/core/utils/custom_theme.dart';
import 'package:flutter/cupertino.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeNotifier(this._customTheme);

  CustomTheme? _customTheme;
  CustomTheme? get customTheme => _customTheme;

  set customTheme(CustomTheme? value) {
    _customTheme = value;
    notifyListeners();
  }
}
