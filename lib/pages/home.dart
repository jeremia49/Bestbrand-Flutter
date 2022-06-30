import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:bestbrand/components/product_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/product.dart';

class HomePage extends StatelessWidget {
  final List<Product> list;

  const HomePage(
    this.list, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
        const SizedBox(
          height: 5,
        ),
        Builder(
          builder: (context) {
            return CarouselSlider(
              options: CarouselOptions(
                height: 300.h,
                enableInfiniteScroll: true,
                viewportFraction: 0.35,
                enlargeCenterPage: false,
                autoPlay: true,
              ),
              items: list.map((e) {
                return ProductView(e);
              }).toList(),
            );
          },
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          'Teknologi dan Perangkat Komputer',
          textAlign: TextAlign.left,
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
            ),
            fontWeight: FontWeight.w700,
          ),
        ),
        Builder(
          builder: (context) {
            return CarouselSlider(
              options: CarouselOptions(
                height: 300.h,
                enableInfiniteScroll: true,
                viewportFraction: 0.35,
                enlargeCenterPage: false,
                autoPlay: false,
              ),
              items: list.map((e) {
                return ProductView(e);
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}
