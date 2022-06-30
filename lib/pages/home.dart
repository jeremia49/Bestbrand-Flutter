import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:bestbrand/components/product_view.dart';
import 'package:google_fonts/google_fonts.dart';

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
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Builder(
          builder: (context) {
            return CarouselSlider(
              options: CarouselOptions(
                enableInfiniteScroll: true,
                viewportFraction: 0.5,
                enlargeCenterPage: false,
                autoPlay: true,
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
