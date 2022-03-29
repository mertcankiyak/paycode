import 'package:flutter/material.dart';
import 'package:paycode/core/components/textfield/search_text_field.dart';
import 'package:paycode/core/constants/colors.dart';
import 'package:paycode/core/constants/size.dart';
import 'package:paycode/core/funcs/toast_message.dart';
import 'package:paycode/core/init/theme/theme_notifier.dart';
import 'package:paycode/view/detail/view/detail_view.dart';
import 'package:provider/provider.dart';
import 'package:paycode/core/extensions/size_extension.dart';
import 'package:intl/intl.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  TextEditingController _searchTextController = TextEditingController();
  bool clicked = false;

  late AnimationController _controller;
  late Animation<Color?> _color;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);

    _color = ColorTween(
            begin: ConstantColors.productAddColor,
            end: ConstantColors.bottomBarGreenIconColor)
        .animate(_controller);

    _controller.stop();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeNotifier>(context).customTheme;
    return ListView(
      children: [
        Padding(
          padding: context.maximumPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hoş geldin",
                    style: theme!.themeData!.textTheme.headline2,
                  ),
                  Text(
                    "Mert Can Kıyak",
                    style: theme.themeData!.textTheme.headline6,
                  ),
                ],
              ),
              Image.network(
                "https://i.hizliresim.com/4bkrv2k.png",
                scale: 10,
              ),
            ],
          ),
        ),
        Padding(
          padding: context.maximumSymetricPadding,
          child: SearchTextFormField(
            hintText: "Markette Arayın",
            icon: Icon(Icons.search),
            textEditingController: _searchTextController,
          ),
        ),
        Padding(
          padding: context.maximumPadding,
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailView(
                                fotoLink:
                                    "https://www.etietieti.com/images/Products/eti-cikolatali-gofret_342_psb.png",
                              )));
                },
                child: Container(
                  width: 200,
                  height: 280,
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
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 280 * 0.7,
                        //color: Colors.red,
                        child: Padding(
                          padding: context.mediumPadding,
                          child: Hero(
                            tag:
                                "https://www.etietieti.com/images/Products/eti-cikolatali-gofret_342_psb.png22",
                            child: Image.network(
                              "https://freepngimg.com/thumb/orange/3-2-orange-png-image-thumb.png",
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: context.minimumSymetricPadding,
                        child: Text(
                          "Portakal",
                          style: theme.themeData!.textTheme.bodyText1,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 280 * 0.18,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: context.minimumSymetricPadding,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Meyve",
                                    style: theme.themeData!.textTheme.headline5,
                                  ),
                                  Text(
                                    "14,99 TL",
                                    style: theme.themeData!.textTheme.bodyText2,
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: (() async {
                                _controller.forward();
                                ToastMessage.show(
                                    title: "Ürün sepete eklendi!");
                                await Future.delayed(
                                    Duration(milliseconds: 500));
                                _controller.reverse();
                              }),
                              child: AnimatedBuilder(
                                animation: _color,
                                builder: (BuildContext _, Widget? __) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            spreadRadius: 1,
                                            blurRadius: 10,
                                            offset: const Offset(0,
                                                1), // changes position of shadow
                                          ),
                                        ],
                                        color: _color.value,
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            bottomLeft: Radius.circular(15))),
                                    child: Padding(
                                      padding: context.spesificPadding(
                                          10, 10, 15, 15),
                                      child: const Icon(
                                        Icons.shopping_bag,
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: context.spesificPadding(
              SizeConstants.maximumSize,
              SizeConstants.mediumSize,
              SizeConstants.maximumSize,
              SizeConstants.maximumSize),
          child: Text(
            "Yeni Eklenenler",
            style: theme.themeData!.textTheme.headline6,
          ),
        ),
        Padding(
          padding: context.maximumSymetricPadding,
          child: Container(
            width: context.getWidth,
            height: context.getHeight * 0.1,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 1), // changes position of shadow
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
                          color: ConstantColors.softGrey.withOpacity(0.1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
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
                            style: theme.themeData!.textTheme.headline2),
                      ],
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
        Divider(),
        Padding(
          padding: context.maximumSymetricPadding,
          child: Container(
            width: context.getWidth,
            height: context.getHeight * 0.1,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 1), // changes position of shadow
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
                          color: ConstantColors.softGrey.withOpacity(0.1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: context.minimumPadding,
                        child: Image.network(
                            "https://simconomy.pinedio.com/img/urunler/4.png"),
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
                          "Elma",
                          style: theme.themeData!.textTheme.headline6,
                        ),
                        SizedBox(
                          height: SizeConstants.minimumSize,
                        ),
                        Text("Meyve",
                            style: theme.themeData!.textTheme.headline2),
                      ],
                    ),
                  ],
                ),
                Text(
                  "9,99 TL",
                  style: theme.themeData!.textTheme.bodyText2,
                ),
              ],
            ),
          ),
        ),
        Divider(),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailView(
                          fotoLink:
                              "https://www.etietieti.com/images/Products/eti-cikolatali-gofret_342_psb.png",
                        )));
          },
          child: Padding(
            padding: context.maximumSymetricPadding,
            child: Container(
              width: context.getWidth,
              height: context.getHeight * 0.1,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          width: context.getWidth * 0.2,
                          height: context.getWidth * 0.15,
                          decoration: BoxDecoration(
                              color: ConstantColors.softGrey.withOpacity(0.1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: context.minimumPadding,
                            child: Hero(
                              tag:
                                  "https://www.etietieti.com/images/Products/eti-cikolatali-gofret_342_psb.png",
                              child: Image.network(
                                  "https://www.etietieti.com/images/Products/eti-cikolatali-gofret_342_psb.png"),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: SizeConstants.minimumSize,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Eti Gofret",
                                style: theme.themeData!.textTheme.headline6,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: SizeConstants.minimumSize,
                              ),
                              Text("Atıştırmalık",
                                  style: theme.themeData!.textTheme.headline2),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "1,99 TL",
                    style: theme.themeData!.textTheme.bodyText2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
