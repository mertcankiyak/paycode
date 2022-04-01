import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductModel {
  static List<ProductModel> maptoList(
      {QuerySnapshot<Map<String, dynamic>>? map}) {
    List<ProductModel> productList = [];
    map!.docs.forEach((element) {
      productList.add(ProductModel.fromMap(element.data()));
    });
    productList.sort((a, b) => b.tarih!.compareTo(a.tarih!));
    return productList;
  }

  ProductModel(
      {this.urunAdi,
      this.urunBarkod,
      this.urunAciklama,
      this.tarih,
      this.urunFiyat,
      this.urunFoto,
      this.urunId,
      this.urunKalori,
      this.urunManset,
      this.urunTur});

  String? urunAdi;
  String? urunBarkod;
  String? urunFiyat;
  String? urunId;
  String? urunTur;
  Timestamp? tarih;
  String? urunFoto;
  String? urunAciklama;
  String? urunKalori;
  bool? urunManset;

  ProductModel.fromMap(Map<String, dynamic> map)
      : urunAdi = map['urun_adi'],
        urunBarkod = map['urun_barkod'],
        urunFiyat = map['urun_fiyat'],
        urunId = map['urun_id'],
        urunTur = map['urun_tur'],
        urunFoto = map['urun_foto'],
        urunAciklama = map['urun_aciklama'],
        urunKalori = map['urun_kalori'],
        urunManset = map['urun_manset'],
        tarih = map['tarih'];
}
