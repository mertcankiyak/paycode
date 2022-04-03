import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paycode/view/main/basket/model/basket_model.dart';

class OrderModel {
  static List<OrderModel> maptoList(
      {QuerySnapshot<Map<String, dynamic>>? map}) {
    List<OrderModel> orderList = [];
    map!.docs.forEach((element) {
      orderList.add(OrderModel.fromMap(element.data()));
    });
    orderList.sort((a, b) => b.siparisTarih!.compareTo(a.siparisTarih!));
    return orderList;
  }

  OrderModel(
      {this.kullaniciId,
      this.orderDetails,
      this.siparisId,
      this.siparisTarih,
      this.siparisTutar});

  String? kullaniciId;
  String? siparisId;
  Timestamp? siparisTarih;
  List<dynamic>? orderDetails;
  String? siparisTutar;

  OrderModel.fromMap(Map<String, dynamic> map)
      : kullaniciId = map['kullanici_id'],
        siparisId = map['siparis_id'],
        siparisTarih = map['siparis_tarih'],
        siparisTutar = map['siparis_tutar'],
        orderDetails = map['siparis_detay'];

  Map<String, dynamic> toMap() {
    return {
      'kullanici_id': kullaniciId,
      'siparis_id': siparisId,
      'siparis_tarih': siparisTarih,
      'siparis_tutar': siparisTutar,
      'siparis_detay': orderDetails,
    };
  }
}

class OrderDetail {
  Map<String, dynamic> orderDetailtoMap({SepetModel? model}) {
    return {
      'urun_adet': model!.urundenKacAdetVar.toString(),
      'urun_adi': model.urununKendisi!.urunAdi,
      'urun_fiyat': model.urununKendisi!.urunFiyat
    };
  }
}
