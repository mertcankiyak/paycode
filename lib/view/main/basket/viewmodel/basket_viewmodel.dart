import 'dart:math';
import 'package:flutter/material.dart';
import 'package:paycode/view/main/basket/model/basket_model.dart';
import 'package:paycode/view/main/home/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BasketViewModel with ChangeNotifier {
  int _productCount = 0;
  double _amount = 0;
  List<SepetModel> _sepetListem = [];

  List<SepetModel> get sepetListem => _sepetListem;

  set sepetListem(List<SepetModel> value) {
    _sepetListem = value;
    notifyListeners();
  }

  int get productCount => _productCount;

  set productCount(int value) {
    _productCount = value;
    notifyListeners();
  }

  double get amount => _amount;

  set amount(double value) {
    _amount = value;
    notifyListeners();
  }

  void urunekle({SepetModel? gelenUrun}) {
    if (sepetListem.length > 0) {
      int gelenIndex = sepetListem
          .indexWhere((element) => element.urunID == gelenUrun!.urunID);
      if (gelenIndex > -1) {
        int? urunsayisi = sepetListem[gelenIndex].urundenKacAdetVar;
        urunsayisi = urunsayisi! + gelenUrun!.urundenKacAdetVar!;
        sepetListem[gelenIndex].urundenKacAdetVar = urunsayisi;
        sum(gelenUrun: gelenUrun);
      } else {
        sepetListem.add(gelenUrun!);
        bilgiVer();
        productCount = sepetListem.length;
        sum(gelenUrun: gelenUrun);
      }
      bilgiVer();
    } else {
      sepetListem.add(gelenUrun!);
      bilgiVer();
      productCount = sepetListem.length;
      sum(gelenUrun: gelenUrun);
    }
  }

  void urunCikar({SepetModel? gelenUrun}) {
    if (sepetListem.length > 0) {
      int gelenIndex = sepetListem
          .indexWhere((element) => element.urunID == gelenUrun!.urunID);
      if (gelenIndex > -1 && sepetListem[gelenIndex].urundenKacAdetVar! > 1) {
        int? urunsayisi = sepetListem[gelenIndex].urundenKacAdetVar;
        urunsayisi = urunsayisi! - gelenUrun!.urundenKacAdetVar!;
        sepetListem[gelenIndex].urundenKacAdetVar = urunsayisi;
        subtract(gelenUrun: gelenUrun);
      }
      bilgiVer();
    }
  }

  void bilgiVer() {
    debugPrint("Sepetteki Ürün Sayısı :" + _sepetListem.length.toString());
    debugPrint("******* Sepetteki Ürün Bilgileri *******\n");
    _sepetListem.forEach((element) {
      debugPrint("Ürünün Adı: " +
          element.urununKendisi!.urunAdi! +
          " Ürünün Sayısı: " +
          element.urundenKacAdetVar.toString() +
          "\n");
    });
  }

  void sum({SepetModel? gelenUrun}) {
    amount += gelenUrun!.urundenKacAdetVar! *
        double.parse(gelenUrun.urununKendisi!.urunFiyat!);
    notifyListeners();
  }

  void subtract({SepetModel? gelenUrun}) {
    amount -= gelenUrun!.urundenKacAdetVar! *
        double.parse(gelenUrun.urununKendisi!.urunFiyat!);
  }

  void deleteProduct({int? index}) {
    amount -= sepetListem[index!].urundenKacAdetVar! *
        double.parse(sepetListem[index].urununKendisi!.urunFiyat!);
    sepetListem.removeAt(index);
    productCount = sepetListem.length;
    notifyListeners();
  }
}
