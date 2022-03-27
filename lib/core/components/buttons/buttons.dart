import 'package:flutter/material.dart';
import 'package:paycode/core/extensions/size_extension.dart';
import 'package:provider/provider.dart';
import 'package:paycode/core/init/theme/theme_notifier.dart';

class RoundedButton extends StatelessWidget {
  final String? text;
  final Color? splashColor;
  final Color? backgroundColor;
  final Icon? icon;
  final VoidCallback? onTap;

  RoundedButton(
      {@required this.text,
      @required this.splashColor,
      @required this.backgroundColor,
      @required this.icon,
      @required this.onTap});

  @override
  Widget build(BuildContext context) {
    final _theme = Provider.of<ThemeNotifier>(context).customTheme;
    return InkWell(
      splashColor: splashColor,
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
            color: backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        width: context.getWidth,
        height: context.getWidth * 0.12,
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            icon!,
            Text(
              text!,
              style: _theme!.themeData!.textTheme.headline3,
              textAlign: TextAlign.center,
            ),
            Container(),
          ],
        )),
      ),
    );
  }
}
