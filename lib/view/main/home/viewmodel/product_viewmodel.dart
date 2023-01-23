import 'package:flutter/material.dart';
import 'package:paycode/locator.dart';
import 'package:paycode/view/main/home/base/urun_base.dart';
import 'package:paycode/view/main/home/model/product_model.dart';
import 'package:paycode/view/main/home/services/product_service.dart';

class ProductViewModel with ChangeNotifier implements ProductBASE {
  final ProductService _productService = locator<ProductService>();

  @override
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      return await _productService.getFeaturedProducts();
    } catch (e) {
      throw "Product View Model getFeaturedProducts Error: " + e.toString();
    }
  }

  @override
  Future<List<ProductModel>> getNewProducts() async {
    try {
      return await _productService.getNewProducts();
    } catch (e) {
      throw "Product View Model getNewProducts Error: " + e.toString();
    }
  }

  @override
  Future<ProductModel?> getProduct({String? productCode}) async {
    try {
      return await _productService.getProduct(productCode: productCode);
    } catch (e) {
      throw "Product View Model getNewProducts Error: " + e.toString();
    }
  }
}
