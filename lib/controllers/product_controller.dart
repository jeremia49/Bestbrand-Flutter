import 'package:get/get.dart';

import '../models/product.dart';
import '../dummy_data.dart' as dummy;

class ProductController extends GetxController {
  var productList = List<Product>.empty().obs;

  @override
  void onInit() {
    super.onInit();
    productList.value = List.of(dummy.productList);
  }
}
