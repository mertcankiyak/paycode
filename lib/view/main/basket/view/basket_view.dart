import 'package:flutter/material.dart';
import 'package:paycode/core/components/textfield/credit_card.dart';
import 'package:paycode/core/components/textfield/text_field.dart';
import 'package:paycode/core/constants/colors.dart';
import 'package:paycode/core/constants/size.dart';
import 'package:paycode/core/extensions/size_extension.dart';
import 'package:paycode/core/funcs/toast_message.dart';
import 'package:paycode/core/init/theme/theme_notifier.dart';
import 'package:paycode/view/authenticate/login/viewmodel/login_viewmodel.dart';
import 'package:paycode/view/main/basket/model/basket_model.dart';
import 'package:paycode/view/main/basket/viewmodel/basket_viewmodel.dart';
import 'package:paycode/view/order/model/order_model.dart';
import 'package:paycode/view/order/viewmodel/order_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class BasketView extends StatefulWidget {
  const BasketView({Key? key}) : super(key: key);

  @override
  State<BasketView> createState() => _BasketViewState();
}

class _BasketViewState extends State<BasketView> with CreditCardValidator {
  TextEditingController _creditCardText = TextEditingController();
  TextEditingController _creditCardDateText = TextEditingController();
  TextEditingController _creditCvvText = TextEditingController();
  GlobalKey<FormState> _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeNotifier>(context).customTheme;
    final _basketViewModel = Provider.of<BasketViewModel>(context);

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
        _basketViewModel.productCount > 0
            ? Expanded(
                child: Stack(
                  children: [
                    ListView.builder(
                      itemCount: _basketViewModel.sepetListem.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction) {
                            _basketViewModel.deleteProduct(index: index);
                          },
                          secondaryBackground: Container(
                            width: context.getWidth,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Center(
                                  child: Text(
                                    'Ürünü Sil',
                                    style: theme.themeData!.textTheme.headline3,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                            color: Colors.red,
                          ),
                          background: Container(),
                          direction: DismissDirection.endToStart,
                          child: Padding(
                            padding: context.minimumPadding,
                            child: Container(
                              width: context.getWidth,
                              height: context.getHeight * 0.1,
                              decoration: BoxDecoration(
                                color: Colors.white,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Container(
                                          width: context.getWidth * 0.2,
                                          height: context.getWidth * 0.15,
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: Padding(
                                            padding: context.minimumPadding,
                                            child: Image.network(
                                                _basketViewModel
                                                    .sepetListem[index]
                                                    .urununKendisi!
                                                    .urunFoto!),
                                          ),
                                        ),
                                        SizedBox(
                                          width: SizeConstants.minimumSize,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                _basketViewModel
                                                    .sepetListem[index]
                                                    .urununKendisi!
                                                    .urunAdi!,
                                                style: theme.themeData!
                                                    .textTheme.subtitle2,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              SizedBox(
                                                height:
                                                    SizeConstants.minimumSize,
                                              ),
                                              Text(
                                                  _basketViewModel
                                                      .sepetListem[index]
                                                      .urununKendisi!
                                                      .urunTur!,
                                                  style: theme.themeData!
                                                      .textTheme.headline5),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
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
                                                    ConstantColors
                                                        .productDecreaseLeft,
                                                    ConstantColors
                                                        .productDecreaseRight,
                                                  ]),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50))),
                                          child: IconButton(
                                              onPressed: () {
                                                SepetModel sp1 = SepetModel(
                                                    urunID: _basketViewModel
                                                        .sepetListem[index]
                                                        .urunID,
                                                    urundenKacAdetVar: 1,
                                                    urununKendisi:
                                                        _basketViewModel
                                                            .sepetListem[index]
                                                            .urununKendisi);
                                                _basketViewModel.urunCikar(
                                                    gelenUrun: sp1);
                                              },
                                              icon: Icon(
                                                Icons.keyboard_arrow_down,
                                                color: ConstantColors
                                                    .bottomBarGreenIconColor,
                                              )),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          _basketViewModel.sepetListem[index]
                                              .urundenKacAdetVar
                                              .toString(),
                                          style: theme
                                              .themeData!.textTheme.subtitle2,
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
                                                    ConstantColors
                                                        .productIncreaseLeft,
                                                    ConstantColors
                                                        .productIncreaseRight,
                                                  ]),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50))),
                                          child: IconButton(
                                              onPressed: () {
                                                SepetModel sp1 = SepetModel(
                                                    urunID: _basketViewModel
                                                        .sepetListem[index]
                                                        .urunID,
                                                    urundenKacAdetVar: 1,
                                                    urununKendisi:
                                                        _basketViewModel
                                                            .sepetListem[index]
                                                            .urununKendisi);
                                                _basketViewModel.urunekle(
                                                    gelenUrun: sp1);
                                              },
                                              icon: Icon(
                                                Icons.keyboard_arrow_up,
                                                color: Colors.white,
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "${_basketViewModel.sepetListem[index].urununKendisi!.urunFiyat!} TL  ",
                                    style: theme.themeData!.textTheme.bodyText2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
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
                              offset: const Offset(
                                  0, 1), // changes position of shadow
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
                                    "${_basketViewModel.amount.toStringAsFixed(2)} TL",
                                    style: theme.themeData!.textTheme.headline1,
                                  )
                                ],
                              ),
                              Material(
                                borderRadius: BorderRadius.circular(10),
                                type: MaterialType.transparency,
                                elevation: 6.0,
                                child: Ink(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            ConstantColors.productIncreaseLeft,
                                            ConstantColors.productIncreaseRight,
                                          ]),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10))),
                                  child: InkWell(
                                    splashColor: ConstantColors.softBlackColor,
                                    borderRadius: BorderRadius.circular(10),
                                    onTap: () {
                                      showModelDialog();
                                    },
                                    child: Padding(
                                      padding: context.mediumPadding,
                                      child: Text(
                                        "Ödeme Yap",
                                        style: theme
                                            .themeData!.textTheme.subtitle1,
                                      ),
                                    ),
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
              )
            : Container(
                width: context.getWidth,
                height: context.getHeight * 0.78,
                child: Center(
                  child: Text(
                    "Sepetinizde Ürün Bulunmamaktadır",
                    style: theme.themeData!.textTheme.bodyText2,
                  ),
                ),
              ),
      ],
    );
  }

  void showModelDialog() {
    final theme =
        Provider.of<ThemeNotifier>(context, listen: false).customTheme;
    final _loginViewModel = Provider.of<LoginViewModel>(context, listen: false);
    final _basketViewModel =
        Provider.of<BasketViewModel>(context, listen: false);
    final _orderViewModel = Provider.of<OrderViewModel>(context, listen: false);
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Form(
              key: _globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CreditCardTextFormField(
                    hintText: "Kredi Kartı Numaranız",
                    icon: Icon(Icons.credit_card),
                    textEditingController: _creditCardText,
                    validator: creditCardNumberControl,
                    maxLength: 16,
                  ),
                  CreditCardTextFormField(
                    hintText: "Son Kullanma Tarihi",
                    icon: Icon(Icons.calendar_today),
                    textEditingController: _creditCardDateText,
                    validator: creditCardDateControl,
                    maxLength: 4,
                  ),
                  CreditCardTextFormField(
                    hintText: "Güvenlik Kodu (CVV)",
                    icon: Icon(Icons.code),
                    textEditingController: _creditCvvText,
                    validator: creditCardCVVControl,
                    maxLength: 3,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    type: MaterialType.transparency,
                    elevation: 6.0,
                    child: Ink(
                      width: context.getWidth,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                ConstantColors.bottomBarGreenIconColor
                                    .withOpacity(0.8),
                                ConstantColors.bottomBarGreenIconColor
                                    .withOpacity(0.9),
                              ]),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: InkWell(
                        splashColor: ConstantColors.softBlackColor,
                        borderRadius: BorderRadius.circular(10),
                        onTap: () async {
                          var uuid = Uuid();
                          _globalKey.currentState!.save();
                          if (_globalKey.currentState!.validate()) {
                            List<Map<String, dynamic>> siparisDetayMap = [];

                            _basketViewModel.sepetListem.forEach((element) {
                              siparisDetayMap.add(OrderDetail()
                                  .orderDetailtoMap(model: element));
                            });

                            OrderModel siparis = OrderModel(
                                kullaniciId: _loginViewModel.loginModel!.id,
                                orderDetails: siparisDetayMap,
                                siparisId: uuid.v4(),
                                siparisTarih: Timestamp.now(),
                                siparisTutar:
                                    _basketViewModel.amount.toString());
                            await _orderViewModel
                                .completeOrder(order: siparis)
                                .then((value) {
                              if (value == true) {
                                ToastMessage.show(
                                    title: "Ödeme İşlemi Tamamlandı!");
                                _basketViewModel.orderComplete();
                                Navigator.pop(context);
                              }
                            });
                          }
                        },
                        child: Padding(
                          padding: context.mediumPadding,
                          child: Text(
                            "Ödemeyi Onayla",
                            style: theme!.themeData!.textTheme.headline3,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class CreditCardValidator {
  String? creditCardNumberControl(String? value) {
    return value!.length != 16 ? "Geçersiz Kart Numarası" : null;
  }

  String? creditCardDateControl(String? value) {
    return value!.length != 4 ? "Geçersiz Tarih" : null;
  }

  String? creditCardCVVControl(String? value) {
    return value!.length != 3 ? "Geçersiz CVV" : null;
  }
}
