import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:paycode/core/constants/colors.dart';
import 'package:paycode/core/constants/size.dart';
import 'package:paycode/core/extensions/size_extension.dart';
import 'package:paycode/core/init/theme/theme_notifier.dart';
import 'package:provider/provider.dart';

class DetailView extends StatefulWidget {
  String? fotoLink;
  DetailView({Key? key, this.fotoLink}) : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  Color backColor = ConstantColors.bodyColor;
  late PaletteGenerator _generator;

  void generateAppBarColor() async {
    _generator = await PaletteGenerator.fromImageProvider(
        NetworkImage(widget.fotoLink!));
    backColor = _generator.dominantColor!.color;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    generateAppBarColor();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeNotifier>(context).customTheme;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: context.getWidth,
              height: context.getHeight,
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset:
                              const Offset(0, 1), // changes position of shadow
                        ),
                      ],
                      color: backColor.withOpacity(0.1),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(75),
                        bottomRight: Radius.circular(75),
                      ),
                    ),
                    width: context.getWidth,
                    height: context.getHeight * 0.35,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: context.mediumPadding,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: context.minimumPadding,
                                    child: Icon(
                                      Icons.arrow_back_ios_new,
                                      color: ConstantColors.productAddColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: context.mediumPadding,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                  padding: context.minimumPadding,
                                  child: Icon(
                                    Icons.shopping_bag_outlined,
                                    color: ConstantColors.productAddColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Hero(
                            tag: widget.fotoLink!,
                            child: Image.network(
                              widget.fotoLink!,
                              width: context.getWidth,
                              height: context.getHeight * 0.25,
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: context.spesificPadding(SizeConstants.mediumSize,
                        0, SizeConstants.mediumSize, SizeConstants.mediumSize),
                    child: Text(
                      "Eti Gofret",
                      style: theme!.themeData!.textTheme.headline1,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: context.mediumSymetricPadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "385 kCal",
                          style: theme.themeData!.textTheme.headline5,
                        ),
                        Row(
                          children: [
                            Transform.scale(
                              scale: 0.8,
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          ConstantColors.productDecreaseLeft,
                                          ConstantColors.productDecreaseRight,
                                        ]),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: ConstantColors
                                          .bottomBarGreenIconColor,
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: context.getWidth * 0.01,
                            ),
                            Container(
                              child: Text(
                                "1",
                                style: theme.themeData!.textTheme.headline6,
                              ),
                            ),
                            SizedBox(
                              width: context.getWidth * 0.01,
                            ),
                            Transform.scale(
                              scale: 0.8,
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          ConstantColors.productIncreaseLeft,
                                          ConstantColors.productIncreaseRight,
                                        ]),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: context.mediumSymetricPadding,
                    child: Text(
                      "Açıklama",
                      style: theme.themeData!.textTheme.headline6,
                    ),
                  ),
                  Padding(
                    padding: context.mediumPadding,
                    child: Text(
                      "Eti Çikolatalı Gofret, hoşbeş lezzetiyle sizlerle! Var dedirten en iyi çikolatalı gofret olma yolunda hızla ilerleyen bu lezzete karşı koyamayacksınız. İçerisinde %14 oranında fındık içeren kreması, incecik gofreti ve eşşisz Eti kalitesiyle tek paket halinde sizlerle.",
                      style: theme.themeData!.textTheme.headline2,
                    ),
                  ),
                ],
              ),
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
                      offset: const Offset(0, 1), // changes position of shadow
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
                            "Fiyat",
                            style: theme.themeData!.textTheme.headline2,
                          ),
                          Text(
                            "14,99 TL",
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
                            "Sepete Ekle",
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
    );
  }
}
