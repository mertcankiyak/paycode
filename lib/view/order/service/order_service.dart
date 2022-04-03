import 'package:flutter/material.dart';
import 'package:paycode/view/order/base/order_base.dart';
import 'package:paycode/view/order/model/order_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class OrderService implements OrderBASE {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<List<OrderModel>> getOrderList({String? userId}) async {
    try {
      QuerySnapshot<Map<String, dynamic>> veri = await _firebaseFirestore
          .collection("siparisler")
          .where("kullanici_id", isEqualTo: userId)
          .get();

      debugPrint("Veri servis içerisi " +
          OrderModel.maptoList(map: veri).length.toString());
      return OrderModel.maptoList(map: veri);
    } catch (e) {
      throw "get Order List Error: " + e.toString();
    }
  }

  @override
  Future<bool> completeOrder({OrderModel? order}) async {
    try {
      DocumentReference orderDetail =
          await _firebaseFirestore.collection("siparisler").add(order!.toMap());
      if (orderDetail.id.length > 0) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw "completeOrder Service Error: " + e.toString();
    }
  }
}
