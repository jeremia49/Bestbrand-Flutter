import 'package:bestbrand/components/review_view.dart';
import 'package:bestbrand/controllers/review_controller.dart';
import 'package:bestbrand/main.dart';
import 'package:flutter/material.dart';
import 'package:bestbrand/components/slider_detail_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../controllers/bookmark_controller.dart';
import '../controllers/cart_controller.dart';
import '../models/product.dart';
import '../provider/menu.dart';
import '../provider/nightmode.dart';

final formatCurrency =
    NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0);

class DetailPage extends StatelessWidget {
  final Product product;
  DetailPage(this.product, {Key? key}) : super(key: key) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
  }

  @override
  Widget build(BuildContext context) {
    final BookmarkController bookmarkController = Get.find();
    final CartController cartController = Get.find();
    final ReviewController reviewController = Get.find();

    return WillPopScope(
      onWillPop: () {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
            overlays: SystemUiOverlay.values);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: null,
        backgroundColor: context.watch<NightModeProvider>().nightmode
            ? Colors.black
            : Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Builder(builder: (context) {
                    return Container(
                        height: 382.h,
                        width: double.infinity,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 241, 237, 237),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: SliderImageDetail(product.imageUrl));
                  }),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Builder(builder: (context) {
                      return IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_outlined,
                          size: 36.sp.toDouble(),
                          color: Colors.black,
                        ),
                      );
                    }),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 5.h, 16.w, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star_outlined,
                          color: Colors.yellow,
                          size: 24.sp.toDouble(),
                        ),
                        Text(
                          '${reviewController.getRating(product.id)} (${reviewController.getRateCount(product.id)})',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color:
                                  context.watch<NightModeProvider>().nightmode
                                      ? Colors.white
                                      : Colors.black,
                            ),
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp.toDouble(),
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => IconButton(
                        onPressed: () {
                          bookmarkController.isBookmark(product.id)
                              ? bookmarkController.removeBookmark(product.id)
                              : bookmarkController.addBookmark(product.id);
                        },
                        icon: Icon(
                          bookmarkController.isBookmark(product.id)
                              ? Icons.bookmark
                              : Icons.bookmark_outline,
                          size: 20.sp,
                          color: context.watch<NightModeProvider>().nightmode
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 5.h, 16.w, 0),
                child: Wrap(
                  children: [
                    Text(
                      product.name,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: context.watch<NightModeProvider>().nightmode
                              ? Colors.white
                              : Colors.black,
                          fontSize: 24.sp,
                        ),
                        fontWeight: FontWeight.w400,
                      ),
                      softWrap: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
                child: Text(
                  product.isPromo == false
                      ? formatCurrency.format(product.harga)
                      : formatCurrency.format(product.hargaPromo),
                  textAlign: TextAlign.left,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: context.watch<NightModeProvider>().nightmode
                          ? Colors.white
                          : Colors.black,
                    ),
                    fontWeight: FontWeight.bold,
                    fontSize: 36.sp,
                  ),
                ),
              ),
              (() {
                if (product.isPromo) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 5.h, 16.w, 0),
                    child: Text(
                      formatCurrency.format(product.harga),
                      textAlign: TextAlign.left,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: context.watch<NightModeProvider>().nightmode
                              ? Colors.white54
                              : Colors.black45,
                        ),
                        fontWeight: FontWeight.normal,
                        fontSize: 32.sp,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              })(),
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 5.h, 16.w, 0),
                child: Text(
                  'Deskripsi :',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: context.watch<NightModeProvider>().nightmode
                          ? Colors.white
                          : Colors.black,
                    ),
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 5.h, 16.w, 0),
                child: ReadMoreText(
                  product.description,
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: ' Show more',
                  trimExpandedText: '\nShow less',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: context.watch<NightModeProvider>().nightmode
                          ? Colors.white
                          : Colors.black,
                    ),
                    fontWeight: FontWeight.normal,
                    fontSize: 14.sp,
                  ),
                  moreStyle: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      color: Colors.red,
                    ),
                    fontWeight: FontWeight.normal,
                    fontSize: 13.sp,
                  ),
                  lessStyle: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      color: Colors.red,
                    ),
                    fontWeight: FontWeight.normal,
                    fontSize: 13.sp,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 10.h),
                child: ElevatedButton.icon(
                  onPressed: () {
                    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                        overlays: SystemUiOverlay.values);
                    cartController.addProduct(product.id);
                    context.read<MenuProvider>().setMenu(2);
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(),
                        ),
                        (Route<dynamic> route) => false);
                  },
                  icon: const Icon(
                    Icons.add_shopping_cart,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Tambah ke Keranjang',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[700],
                  ),
                ),
              ),
              const SizedBox.shrink(),
              ReviewView(product.id),
            ],
          ),
        ),
      ),
    );
  }
}
