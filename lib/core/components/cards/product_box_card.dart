import 'package:flutter/material.dart';
import 'package:paycode/core/constants/colors.dart';
import 'package:paycode/core/extensions/size_extension.dart';
import 'package:paycode/core/funcs/toast_message.dart';
import 'package:paycode/core/init/theme/theme_notifier.dart';
import 'package:paycode/view/detail/view/detail_view.dart';
import 'package:paycode/view/main/basket/model/basket_model.dart';
import 'package:paycode/view/main/basket/viewmodel/basket_viewmodel.dart';
import 'package:paycode/view/main/home/model/product_model.dart';
import 'package:provider/provider.dart';

class ProductCardBox extends StatefulWidget {
  final ProductModel? productModel;
  const ProductCardBox({Key? key, this.productModel}) : super(key: key);

  @override
  State<ProductCardBox> createState() => _ProductCardBoxState();
}

class _ProductCardBoxState extends State<ProductCardBox>
    with TickerProviderStateMixin {
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
    final _basketViewModel = Provider.of<BasketViewModel>(context);
    return Padding(
      padding: context.mediumPadding,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailView(
                            productModel: widget.productModel,
                          )));
            },
            child: Container(
              width: context.getWidth * 0.50,
              height: context.getWidth * 0.75,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 1), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
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
                        tag: widget.productModel!.urunFoto.toString(),
                        child: Image.network(
                          widget.productModel!.urunFoto.toString(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: context.minimumSymetricPadding,
                    child: Text(
                      widget.productModel!.urunAdi!,
                      style: theme!.themeData!.textTheme.bodyText1,
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                widget.productModel!.urunTur!,
                                style: theme.themeData!.textTheme.headline5,
                              ),
                              Text(
                                "${widget.productModel!.urunFiyat} TL",
                                style: theme.themeData!.textTheme.bodyText2,
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: (() async {
                            _controller.forward();
                            ToastMessage.show(title: "Ürün sepete eklendi!");
                            SepetModel sp1 = SepetModel(
                                urunID: widget.productModel!.urunId,
                                urundenKacAdetVar: 1,
                                urununKendisi: widget.productModel);
                            _basketViewModel.urunekle(gelenUrun: sp1);
                            await Future.delayed(Duration(milliseconds: 500));
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
                                        offset: const Offset(
                                            0, 1), // changes position of shadow
                                      ),
                                    ],
                                    color: _color.value,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        bottomLeft: Radius.circular(15))),
                                child: Padding(
                                  padding:
                                      context.spesificPadding(10, 10, 15, 15),
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
    );
  }
}
