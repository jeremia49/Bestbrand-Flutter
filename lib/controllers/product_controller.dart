import 'package:get/get.dart';

import '../models/product.dart';
import '../dummy_data.dart' as dummy;

class ProductController extends GetxController {
  var productList = List<Product>.empty().obs;

  @override
  void onInit() {
    super.onInit();
    productList.value = List.of(dummy.productList);
    productList.add(Product(99, 'apapun jadi12312', 50000, 'halodunia', [
      'https://images.tokopedia.net/img/cache/900/VqbcmM/2022/5/16/22a43944-f71e-47fa-bb24-5d81c7184436.jpg',
    ]));
  }
}
