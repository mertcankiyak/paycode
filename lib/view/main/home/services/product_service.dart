import 'package:flutter/material.dart';
import 'package:paycode/view/main/home/base/urun_base.dart';
import 'package:paycode/view/main/home/model/product_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductService implements ProductBASE {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      QuerySnapshot<Map<String, dynamic>> productsMap = await _firebaseFirestore
          .collection("urunler")
          .where("manset", isEqualTo: true)
          .get();
      return ProductModel.maptoList(map: productsMap);
    } catch (e) {
      throw "Product Service getFeaturedProducts Error: " + e.toString();
    }
  }

  @override
  Future<List<ProductModel>> getNewProducts() async {
    try {
      QuerySnapshot<Map<String, dynamic>> productsMap = await _firebaseFirestore
          .collection("urunler")
          .where("manset", isEqualTo: false)
          .get();
      return ProductModel.maptoList(map: productsMap);
    } catch (e) {
      throw "Product Service getNewProducts Error: " + e.toString();
    }
  }

  @override
  Future<ProductModel> getProduct({String? productCode}) async {
    try {
      QuerySnapshot<Map<String, dynamic>> productsMap = await _firebaseFirestore
          .collection("urunler")
          .where("urun_barkod", isEqualTo: productCode)
          .get();
      return ProductModel.fromMap(productsMap.docs[0].data());
    } catch (e) {
      throw "Product Service getNewProducts Error: " + e.toString();
    }
  }
}
