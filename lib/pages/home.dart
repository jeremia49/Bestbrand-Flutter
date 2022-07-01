import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:bestbrand/components/product_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/optional_product.dart';
import '../controllers/product_controller.dart';
import '../models/product.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find();

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Tawaran terbaik hari ini',
            textAlign: TextAlign.left,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
              ),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Builder(
            builder: (context) {
              return CarouselSlider(
                options: CarouselOptions(
                  height: 300.h,
                  enableInfiniteScroll: true,
                  viewportFraction: 0.4,
                  enlargeCenterPage: false,
                  autoPlay: true,
                ),
                items: productController.productList
                    .where((p0) => p0.isPromo == true)
                    .toList()
                    .map((e) {
                  return ProductView(e);
                }).toList(),
              );
            },
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            'Beli Pulsa, Listrik, dll.',
            textAlign: TextAlign.left,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
              ),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          const OptionalProduct(),
          SizedBox(
            height: 15.h,
          ),
          Text(
            'Keyboard',
            textAlign: TextAlign.left,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
              ),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Builder(
            builder: (context) {
              return CarouselSlider(
                options: CarouselOptions(
                  height: 300.h,
                  enableInfiniteScroll: true,
                  viewportFraction: 0.4,
                  enlargeCenterPage: false,
                  autoPlay: false,
                ),
                items: productController.productList
                    .where((p0) => p0.tag.contains('keyboard'))
                    .toList()
                    .map((e) {
                  return ProductView(e);
                }).toList(),
              );
            },
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            'Kursi Gaming',
            textAlign: TextAlign.left,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
              ),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Builder(
            builder: (context) {
              return CarouselSlider(
                options: CarouselOptions(
                  height: 300.h,
                  enableInfiniteScroll: true,
                  viewportFraction: 0.4,
                  enlargeCenterPage: false,
                  autoPlay: false,
                ),
                items: productController.productList
                    .where((p0) => p0.tag.contains('kursi'))
                    .toList()
                    .map((e) {
                  return ProductView(e);
                }).toList(),
              );
            },
          ),
          SizedBox(
            height: 15.h,
          ),
        ],
      ),
    );
  }
}
