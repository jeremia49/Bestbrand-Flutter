import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:bestbrand/components/product_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/product.dart';

class HomeLayout extends StatelessWidget {
  final List<Product> list;

  const HomeLayout({
    required this.list,
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
              fontSize: 12,
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
                  enableInfiniteScroll: false,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                ),
                items: (() {
                  List<Widget> carousel = [];
                  for (int i = 0; i < list.length; i++) {
                    carousel.add(Row(
                      children: [
                        ProductView(list[i]),
                        SizedBox(
                          width: 4,
                        ),
                        (() {
                          if ((i + 1) != list.length) {
                            i++;
                            return ProductView(list[i]);
                          } else {
                            return SizedBox(
                              width: 250,
                            );
                          }
                        })(),
                      ],
                    ));
                  }
                  return carousel;
                })());
          },
        ),
      ],
    );
  }
}
