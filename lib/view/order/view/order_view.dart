import 'package:flutter/material.dart';
import 'package:paycode/core/constants/colors.dart';
import 'package:paycode/core/init/theme/theme_notifier.dart';
import 'package:paycode/view/authenticate/login/viewmodel/login_viewmodel.dart';
import 'package:paycode/view/order/model/order_model.dart';
import 'package:paycode/view/order/view/order_detail_view.dart';
import 'package:paycode/view/order/viewmodel/order_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:paycode/core/extensions/timestamp_extension.dart';
import 'package:paycode/core/extensions/string_extensions.dart';
import 'package:paycode/core/extensions/datetime_extension.dart';

class OrderView extends StatefulWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  @override
  Widget build(BuildContext context) {
    final _orderViewModel = Provider.of<OrderViewModel>(context);
    final _loginViewModel = Provider.of<LoginViewModel>(context);
    final theme = Provider.of<ThemeNotifier>(context).customTheme;
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
          title: Text(
            "Siparişlerim",
            style: theme!.themeData!.textTheme.headline6,
          ),
        ),
        body: FutureBuilder(
          future: _orderViewModel.getOrderList(
              userId: _loginViewModel.loginModel!.id),
          builder: (BuildContext context,
              AsyncSnapshot<List<OrderModel>> snapshots) {
            if (snapshots.hasData) {
              return Card(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshots.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrderDetailView(
                                        orderDetail: snapshots.data![index],
                                      )));
                        },
                        title: Text(
                            "Sipariş Numarası: " +
                                snapshots.data![index].siparisId!.split("-")[0],
                            style: theme.themeData!.textTheme.headline4),
                        subtitle: Text(
                            "Sipariş Tarihi: " +
                                snapshots
                                    .data![index].siparisTarih.dateTimeaCevir,
                            style: theme.themeData!.textTheme.headline5),
                        trailing: Text(
                            double.parse(snapshots.data![index].siparisTutar!)
                                    .toStringAsFixed(2)
                                    .toString() +
                                " TL",
                            style: theme.themeData!.textTheme.bodyText2),
                        leading: CircleAvatar(
                          backgroundColor:
                              ConstantColors.bottomBarGreenIconColor,
                          child: Text(
                            snapshots.data![index].orderDetails!.length
                                .toString(),
                            style: theme.themeData!.textTheme.headline3,
                          ),
                        ),
                      );
                    }),
              );
            } else {
              return Text("Veri gelmedi");
            }
          },
        ),
      ),
    );
  }
}
/**
 * 
 * ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshots.data![index].orderDetails!.length,
                        itemBuilder: (context, sayac) {
                          return Text(snapshots
                              .data![index].orderDetails![sayac]["urun_adi"]);
                        });
 */