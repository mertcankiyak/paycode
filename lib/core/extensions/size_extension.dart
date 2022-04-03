import 'package:flutter/material.dart';
import 'package:paycode/core/constants/size.dart';

extension SizeExtension on BuildContext {
  double get getWidth => MediaQuery.of(this).size.width;
  double get getHeight => MediaQuery.of(this).size.height;

  EdgeInsets get minimumPadding => EdgeInsets.all(SizeConstants.minimumSize);
  EdgeInsets get mediumPadding => EdgeInsets.all(SizeConstants.mediumSize);
  EdgeInsets get maximumPadding => EdgeInsets.all(SizeConstants.maximumSize);

  EdgeInsets get minimumSymetricPadding =>
      EdgeInsets.symmetric(horizontal: SizeConstants.minimumSize);
  EdgeInsets get mediumSymetricPadding =>
      EdgeInsets.symmetric(horizontal: SizeConstants.mediumSize);
  EdgeInsets get maximumSymetricPadding =>
      EdgeInsets.symmetric(horizontal: SizeConstants.maximumSize);

  EdgeInsets spesificPadding(
          double top, double bottom, double left, double right) =>
      EdgeInsets.only(top: top, bottom: bottom, right: right, left: left);

  EdgeInsets get listProductMediumPadding => EdgeInsets.only(
      left: SizeConstants.mediumSize,
      bottom: SizeConstants.mediumSize,
      right: SizeConstants.mediumSize);
  EdgeInsets get listProductMinimumPadding => EdgeInsets.only(
      left: SizeConstants.mediumSize,
      bottom: SizeConstants.minimumSize,
      right: SizeConstants.mediumSize);
  EdgeInsets get boxProductMinimumPadding => EdgeInsets.only(
      left: SizeConstants.mediumSize,
      bottom: SizeConstants.minimumSize,
      right: SizeConstants.mediumSize);
}
