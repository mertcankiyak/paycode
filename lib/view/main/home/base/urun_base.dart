import 'package:paycode/view/main/home/model/product_model.dart';

abstract class ProductBASE {
  Future<List<ProductModel>> getFeaturedProducts();
  Future<List<ProductModel>> getNewProducts();
}
