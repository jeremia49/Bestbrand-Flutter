import 'package:bestbrand/controllers/product_controller.dart';
import 'package:bestbrand/models/cart.dart';
import 'package:get/get.dart';

import '../dummy_data.dart' as dummy;
import '../models/product.dart';

class CartController extends GetxController {
  var cartList = List<Cart>.empty().obs;

  @override
  void onInit() {
    super.onInit();
    cartList.value = List.of(dummy.cartList);
  }

  removeProduct(int id) {
    cartList.removeWhere((item) => item.id == id);
  }

  addProduct(int id) {
    int indexat =
        cartList.map((element) => element.id == id).toList().indexOf(true);
    if (indexat != -1) {
      cartList[indexat].quantity += 1;
    } else {
      cartList.add(Cart(id));
    }
  }

  int getPrice(Product product) {
    if (product.isPromo) {
      return product.hargaPromo;
    }
    return product.harga;
  }

  int get totalPrice {
    final ProductController productController = Get.find();
    return cartList.fold(0, (sum, e1) {
      return sum +
          getPrice(productController.productList
                  .firstWhere((element) => element.id == e1.id)) *
              e1.quantity;
    });
  }
}
