import 'package:bestbrand/controllers/product_controller.dart';
import 'package:bestbrand/controllers/review_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../pages/detail.dart';
import '../provider/nightmode.dart';

class ReviewView extends StatelessWidget {
  final int idProduct;
  double stars = 0;
  String txt = '';
  ReviewView(this.idProduct, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ReviewController reviewController = Get.find();
    final ProductController productController = Get.find();

    return Container(
      height: 300.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Review Pengguna :',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: context.watch<NightModeProvider>().nightmode
                            ? Colors.white
                            : Colors.black,
                        fontSize: 15.sp,
                      ),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        height: 20,
                        color: context.watch<NightModeProvider>().nightmode
                            ? Colors.white
                            : Colors.black,
                      ),
                      itemBuilder: (context, item) => ListTile(
                        onTap: () {},
                        title: Row(
                          children: [
                            Icon(
                              Icons.star_outlined,
                              color: Colors.yellow,
                              size: 24.sp.toDouble(),
                            ),
                            Text(
                              reviewController
                                  .getReviewById(idProduct)[item]
                                  .stars
                                  .toString(),
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: context
                                          .watch<NightModeProvider>()
                                          .nightmode
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 14.sp,
                                ),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          reviewController
                              .getReviewById(idProduct)[item]
                              .review,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color:
                                  context.watch<NightModeProvider>().nightmode
                                      ? Colors.white
                                      : Colors.black,
                              fontSize: 14.sp,
                            ),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      itemCount:
                          reviewController.getReviewById(idProduct).length,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                )),
                builder: (context) => Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Dalam skala 1-5 berapa penilaian produk kami menurut anda',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                          ),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      StatefulBuilder(
                        builder: ((context, setState) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.star_outlined,
                                    color: Colors.yellow,
                                    size: 24.sp.toDouble(),
                                  ),
                                  Text(
                                    stars.toString(),
                                    style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                      ),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Slider(
                                  value: stars,
                                  min: 0.0,
                                  max: 5.0,
                                  divisions: 5,
                                  onChanged: (selection) {
                                    setState(() {
                                      stars = selection;
                                    });
                                  }),
                            ],
                          );
                        }),
                      ),
                      Text(
                        'Silahkan masukkan review anda',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                          ),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Row(
                          children: [
                            Expanded(
                              child: StatefulBuilder(
                                builder: ((context, setState) {
                                  return TextField(
                                    onChanged: (e) {
                                      setState(
                                        () {
                                          txt = e;
                                        },
                                      );
                                    },
                                  );
                                }),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                if (txt.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Silahkan isi review terlebih dahulu !')));
                                  Navigator.of(context).pop();
                                  return;
                                }
                                reviewController.addReview(
                                    idProduct, stars.toInt(), txt);
                                stars = 0;
                                txt = '';
                                Navigator.of(context).pop();
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => MyHomePage(),
                                    ),
                                    (Route<dynamic> route) => false);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                        productController.productList
                                            .firstWhere((element) =>
                                                element.id == idProduct)),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.send),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: Text('Tambah Review'),
          )
        ],
      ),
    );
  }
}
