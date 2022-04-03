import 'package:flutter/material.dart';
import 'package:paycode/core/constants/colors.dart';
import 'package:paycode/core/init/theme/theme_notifier.dart';
import 'package:paycode/view/order/model/order_model.dart';
import 'package:shimmer/shimmer.dart';
import 'package:provider/provider.dart';
import 'package:paycode/core/extensions/timestamp_extension.dart';
import 'package:paycode/core/extensions/string_extensions.dart';
import 'package:paycode/core/extensions/datetime_extension.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paycode/core/extensions/size_extension.dart';

class OrderDetailView extends StatefulWidget {
  final OrderModel? orderDetail;
  const OrderDetailView({Key? key, this.orderDetail}) : super(key: key);

  @override
  State<OrderDetailView> createState() => _OrderDetailViewState();
}

class _OrderDetailViewState extends State<OrderDetailView> {
  @override
  Widget build(BuildContext context) {
    final _theme = Provider.of<ThemeNotifier>(context).customTheme;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: ConstantColors.bodyColor,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new),
              color: ConstantColors.softBlackColor,
            ),
          ),
          body: Card(
            child: Column(
              children: [
                Shimmer.fromColors(
                  period: Duration(seconds: 5),
                  baseColor: Colors.green,
                  highlightColor: Colors.greenAccent,
                  child: Text('payCode',
                      textAlign: TextAlign.center,
                      style: _theme!.themeData!.textTheme.headline1),
                ),
                Padding(
                  padding: context.minimumPadding,
                  child: Text(
                    "Bilgilendirme Fişi",
                    style: _theme.themeData!.textTheme.headline5,
                  ),
                ),
                Text(
                  "Alışveriş Tarihi: " +
                      widget.orderDetail!.siparisTarih.dateTimeaCevir,
                  style: _theme.themeData!.textTheme.subtitle2,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.orderDetail!.orderDetails!.length,
                    itemBuilder: (context, sayac) {
                      return Padding(
                        padding: context.spesificPadding(8, 0, 8, 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.orderDetail!.orderDetails![sayac]
                                  ["urun_adi"],
                              style: TextStyle(
                                  color: ConstantColors.softBlackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily:
                                      GoogleFonts.josefinSans().fontFamily),
                            ),
                            Row(
                              children: [
                                Text(" * "),
                                Text(
                                  widget.orderDetail!.orderDetails![sayac]
                                          ["urun_adet"] +
                                      " (Adet) ",
                                  style: TextStyle(
                                      color: ConstantColors.softBlackColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily:
                                          GoogleFonts.josefinSans().fontFamily),
                                ),
                                Text(
                                  (double.parse(widget.orderDetail!
                                                      .orderDetails![sayac]
                                                  ["urun_fiyat"]) *
                                              int.parse(widget.orderDetail!
                                                      .orderDetails![sayac]
                                                  ["urun_adet"]))
                                          .toStringAsFixed(2) +
                                      " TL",
                                  style: TextStyle(
                                      color: ConstantColors.softBlackColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily:
                                          GoogleFonts.josefinSans().fontFamily),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }),
                Padding(
                  padding: context.mediumPadding,
                  child: Text(
                    "Toplam Tutar " +
                        widget.orderDetail!.siparisTutar.toString() +
                        " TL",
                    style: TextStyle(
                        color: ConstantColors.softBlackColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.josefinSans().fontFamily),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
