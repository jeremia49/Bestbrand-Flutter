import 'package:bestbrand/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../controllers/product_controller.dart';
import '../models/product.dart';
import '../provider/nightmode.dart';
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
            () => cartController.cartList.isEmpty
                ? Center(
                    child: Text(
                      'Belum ada data',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: context.watch<NightModeProvider>().nightmode
                              ? Colors.white
                              : Colors.black87,
                        ),
                        fontWeight: FontWeight.normal,
                        fontSize: 14.sp,
                      ),
                    ),
                  )
                : ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      height: 20,
                      color: context.watch<NightModeProvider>().nightmode
                          ? Colors.white
                          : Colors.black87,
                    ),
                    itemBuilder: (context, index) {
                      Product product = productController.productList
                          .firstWhere((element) =>
                              element.id == cartController.cartList[index].id);
                      return ListTile(
                        subtitle: Text(
                          'Kuantitas : ${cartController.cartList[index].quantity} | Harga @ ${formatCurrency.format(getPrice(product))}',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color:
                                  context.watch<NightModeProvider>().nightmode
                                      ? Colors.white
                                      : Colors.black87,
                            ),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
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
                            textStyle: TextStyle(
                              color:
                                  context.watch<NightModeProvider>().nightmode
                                      ? Colors.white
                                      : Colors.black87,
                            ),
                            fontWeight: FontWeight.normal,
                            fontSize: 14.sp,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: context.watch<NightModeProvider>().nightmode
                                ? Colors.white
                                : Colors.black87,
                          ),
                          onPressed: () {
                            cartController.removeProduct(
                              cartController.cartList[index].id,
                            );
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
                    textStyle: TextStyle(
                      color: context.watch<NightModeProvider>().nightmode
                          ? Colors.white
                          : Colors.black,
                    ),
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
              ),
              Obx(
                () => cartController.cartList.isEmpty
                    ? SizedBox(
                        height: 5.h,
                      )
                    : Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            if (cartController.cartList.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Cart masih kosong !'),
                                ),
                              );
                            }
                            cartController.cartList.value = List.of([]);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Pembelian berhasil dilakukan, cart akan dikosongkan !'),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.arrow_right_alt,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Proses Pembelian',
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue[700],
                          ),
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
