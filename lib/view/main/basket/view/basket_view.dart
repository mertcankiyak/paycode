import 'package:flutter/material.dart';
import 'package:paycode/core/components/textfield/text_field.dart';
import 'package:paycode/core/constants/colors.dart';
import 'package:paycode/core/constants/size.dart';
import 'package:paycode/core/extensions/size_extension.dart';
import 'package:paycode/core/init/theme/theme_notifier.dart';
import 'package:provider/provider.dart';

class BasketView extends StatefulWidget {
  const BasketView({Key? key}) : super(key: key);

  @override
  State<BasketView> createState() => _BasketViewState();
}

class _BasketViewState extends State<BasketView> {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeNotifier>(context).customTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: context.mediumPadding,
          child: Text(
            "Sepetiniz",
            style: theme!.themeData!.textTheme.headline6,
            maxLines: 1,
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              ListView(
                children: [
                  Padding(
                    padding: context.minimumSymetricPadding,
                    child: Container(
                      width: context.getWidth,
                      height: context.getHeight * 0.1,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: const Offset(
                                0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: context.getWidth * 0.2,
                                height: context.getWidth * 0.15,
                                decoration: BoxDecoration(
                                    color: ConstantColors.softGrey
                                        .withOpacity(0.1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Padding(
                                  padding: context.minimumPadding,
                                  child: Image.network(
                                      "https://freepngimg.com/thumb/orange/3-2-orange-png-image-thumb.png"),
                                ),
                              ),
                              SizedBox(
                                width: SizeConstants.minimumSize,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Portakal",
                                    style: theme.themeData!.textTheme.headline6,
                                  ),
                                  SizedBox(
                                    height: SizeConstants.minimumSize,
                                  ),
                                  Text("Meyve",
                                      style:
                                          theme.themeData!.textTheme.headline2),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Transform.scale(
                                scale: 0.6,
                                child: Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            ConstantColors.productDecreaseLeft,
                                            ConstantColors.productDecreaseRight,
                                          ]),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: ConstantColors
                                            .bottomBarGreenIconColor,
                                      )),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "1",
                                  style: theme.themeData!.textTheme.headline6,
                                ),
                              ),
                              Transform.scale(
                                scale: 0.6,
                                child: Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            ConstantColors.productIncreaseLeft,
                                            ConstantColors.productIncreaseRight,
                                          ]),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.keyboard_arrow_up,
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "10,99 TL",
                            style: theme.themeData!.textTheme.bodyText2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset:
                            const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                  ),
                  width: context.getWidth,
                  height: context.getHeight * 0.13,
                  child: Padding(
                    padding: context.mediumPadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Toplam Tutar",
                              style: theme.themeData!.textTheme.headline2,
                            ),
                            Text(
                              "143,99 TL",
                              style: theme.themeData!.textTheme.headline1,
                            )
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    ConstantColors.productIncreaseLeft,
                                    ConstantColors.productIncreaseRight,
                                  ]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: context.mediumPadding,
                            child: Text(
                              "Ödeme Yap",
                              style: theme.themeData!.textTheme.subtitle1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
