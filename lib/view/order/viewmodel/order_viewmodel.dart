import 'package:flutter/material.dart';
import 'package:paycode/locator.dart';
import 'package:paycode/view/order/base/order_base.dart';
import 'package:paycode/view/order/model/order_model.dart';
import 'package:paycode/view/order/service/order_service.dart';

class OrderViewModel with ChangeNotifier implements OrderBASE {
  OrderService _orderService = locator<OrderService>();

  @override
  Future<List<OrderModel>> getOrderList({String? userId}) async {
    try {
      return await _orderService.getOrderList(userId: userId);
    } catch (e) {
      throw "Get Order List Error: " + e.toString();
    }
  }

  @override
  Future<bool> completeOrder({OrderModel? order}) async {
    try {
      return await _orderService.completeOrder(order: order);
    } catch (e) {
      throw "completeOrder ViewModel Error: " + e.toString();
    }
  }
}
