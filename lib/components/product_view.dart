import 'package:bestbrand/models/product.dart';
import 'package:bestbrand/pages/detail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:intl/intl.dart';

final formatCurrency =
    NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0);

class ProductView extends StatelessWidget {
  final Product product;
  const ProductView(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: Color.fromARGB(255, 244, 255, 247),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(product),
              ),
            );
          },
          child: ListTile(
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Builder(builder: (context) {
                  return Container(
                    height: 128.h,
                    width: 124.w,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: product.imageUrl[0],
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Image.asset(
                        cupertinoActivityIndicator,
                        fit: BoxFit.contain,
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  );
                }),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: AutoSizeText(
                                  product.name,
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13.sp,
                                  ),
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  print('added to bookmark');
                                },
                                icon: Icon(
                                  Icons.bookmark,
                                  size: 20.sp,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            product.isPromo == false
                                ? formatCurrency.format(product.harga)
                                : formatCurrency.format(product.hargaPromo),
                            textAlign: TextAlign.left,
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                color: Colors.black,
                              ),
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          (() {
                            if (product.isPromo) {
                              return Text(
                                formatCurrency.format(product.harga),
                                textAlign: TextAlign.left,
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                    color: Colors.black45,
                                  ),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 13.sp,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                          })(),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star_outlined,
                                color: Colors.yellow,
                                size: 14.sp,
                              ),
                              Text(
                                '${product.rating} (${product.ratingCounter})',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
