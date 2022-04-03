import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paycode/core/init/theme/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:paycode/core/extensions/size_extension.dart';

class CreditCardTextFormField extends StatelessWidget {
  final String? hintText;
  final Icon? icon;
  final TextEditingController? textEditingController;
  final FormFieldValidator<String>? validator;
  final bool obsecureText;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final int? maxLength;

  CreditCardTextFormField({
    required this.hintText,
    required this.icon,
    required this.textEditingController,
    this.validator,
    this.obsecureText = false,
    this.onTap,
    this.keyboardType,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    final _theme = Provider.of<ThemeNotifier>(context).customTheme;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
      ),
      child: Padding(
        padding: context.spesificPadding(5, 5, 20, 0),
        child: TextFormField(
          inputFormatters: [
            LengthLimitingTextInputFormatter(maxLength),
          ],
          keyboardType: keyboardType ?? TextInputType.number,
          onTap: onTap,
          style: _theme!.themeData!.textTheme.headline2,
          obscureText: obsecureText,
          validator: validator,
          controller: textEditingController,
          decoration: InputDecoration(
              suffixIcon: icon,
              hintText: hintText,
              hintStyle: _theme.themeData!.textTheme.headline5,
              border: InputBorder.none,
              fillColor: Colors.grey,
              focusColor: Colors.grey),
        ),
      ),
    );
  }
}
