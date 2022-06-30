import 'package:bestbrand/components/slider_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

import '../models/product.dart';

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
    return WillPopScope(
      onWillPop: () {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
            overlays: SystemUiOverlay.values);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: null,
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
                          '${product.rating} (${product.ratingCounter})',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              color: Colors.black,
                            ),
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp.toDouble(),
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.bookmark,
                      size: 36.sp.toDouble(),
                    )
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
                          color: Colors.black,
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
                    textStyle: const TextStyle(
                      color: Colors.black,
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
                        textStyle: const TextStyle(
                          color: Colors.black45,
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
                    textStyle: const TextStyle(
                      color: Colors.black,
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
                  trimLines: 3,
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: ' Show more',
                  trimExpandedText: ' Show less',
                  moreStyle: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    fontWeight: FontWeight.normal,
                    fontSize: 13.sp,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 10.h),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.add_shopping_cart),
                  label: Text('Tambah ke Keranjang'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
