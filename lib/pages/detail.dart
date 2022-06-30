import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';

import '../models/product.dart';

class DetailPage extends StatelessWidget {
  final Product product;
  DetailPage(this.product, {Key? key}) : super(key: key) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: null,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Builder(builder: (context) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: double.infinity,
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
                            fit: BoxFit.fill,
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
                Positioned(
                  top: 0,
                  left: 0,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
              ],
            ),
            Text(
              product.name,
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
          ],
        ),
      ),
    );
  }
}
