import 'package:bestbrand/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controllers/product_controller.dart';
import '../models/product.dart';
import 'detail.dart';

final formatCurrency =
    NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0);

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  int getPrice(Product product) {
    if (product.isPromo) {
      return product.hargaPromo;
    }
    return product.harga;
  }

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();
    final ProductController productController = Get.find();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Obx(
            () => ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                height: 20,
                color: Colors.black,
              ),
              itemBuilder: (context, index) {
                Product product = productController.productList.firstWhere(
                    (element) =>
                        element.id == cartController.cartList[index].id);
                return ListTile(
                  subtitle: Text(
                      'Kuantitas : ${cartController.cartList[index].quantity} | Harga @ ${formatCurrency.format(getPrice(product))}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(product),
                      ),
                    );
                  },
                  leading: CachedNetworkImage(
                    imageUrl: product.imageUrl[0],
                    imageBuilder: (context, imageProvider) => SizedBox(
                      height: 100.h,
                      width: 100.w,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Image.asset(
                      cupertinoActivityIndicator,
                      fit: BoxFit.contain,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  title: Text(
                    product.name,
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      fontWeight: FontWeight.normal,
                      fontSize: 14.sp,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      cartController
                          .removeProduct(cartController.cartList[index].id);
                    },
                  ),
                );
              },
              itemCount: cartController.cartList.length,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(5, 10, 5, 30),
          child: Column(
            children: [
              Obx(
                () => Text(
                  'Total Harga :  ${formatCurrency.format(cartController.totalPrice)}',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
