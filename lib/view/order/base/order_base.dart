import 'package:paycode/view/order/model/order_model.dart';

abstract class OrderBASE {
  Future<List<OrderModel>> getOrderList({String? userId});
  Future<bool> completeOrder({OrderModel? order});
}
