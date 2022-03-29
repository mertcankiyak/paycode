import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:paycode/core/constants/colors.dart';

class ToastMessage {
  static show({String? title}) {
    Fluttertoast.showToast(
        msg: title!,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ConstantColors.bottomBarGreenIconColor,
        textColor: ConstantColors.softBlackColor,
        fontSize: 16.0);
  }
}
