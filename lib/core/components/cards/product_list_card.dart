import 'package:flutter/material.dart';
import 'package:paycode/core/constants/colors.dart';
import 'package:paycode/core/constants/size.dart';
import 'package:paycode/core/extensions/size_extension.dart';
import 'package:paycode/core/funcs/toast_message.dart';
import 'package:paycode/core/init/theme/theme_notifier.dart';
import 'package:paycode/view/detail/view/detail_view.dart';
import 'package:paycode/view/main/basket/model/basket_model.dart';
import 'package:paycode/view/main/basket/viewmodel/basket_viewmodel.dart';
import 'package:paycode/view/main/home/model/product_model.dart';
import 'package:provider/provider.dart';

class ProductCardList extends StatefulWidget {
  final ProductModel? productModel;
  const ProductCardList({Key? key, this.productModel}) : super(key: key);

  @override
  State<ProductCardList> createState() => _ProductCardListState();
}

class _ProductCardListState extends State<ProductCardList>
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
      padding: context.listProductMinimumPadding,
      child: Container(
        width: context.getWidth,
        height: context.getHeight * 0.1,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailView(
                          productModel: widget.productModel,
                        )));
          },
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
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: context.minimumPadding,
                        child: Hero(
                            tag: widget.productModel!.urunFoto.toString(),
                            child:
                                Image.network(widget.productModel!.urunFoto!)),
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
                            widget.productModel!.urunAdi!,
                            style: theme!.themeData!.textTheme.headline6,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: SizeConstants.minimumSize,
                          ),
                          Text(widget.productModel!.urunTur!,
                              style: theme.themeData!.textTheme.headline2),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "${widget.productModel!.urunFiyat!} TL",
                style: theme.themeData!.textTheme.bodyText2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
