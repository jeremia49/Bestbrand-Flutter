import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/product_view.dart';
import '../controllers/bookmark_controller.dart';
import '../controllers/product_controller.dart';
import '../models/product.dart';

class BookmarkPage extends StatelessWidget {
  final List<Product> list;
  const BookmarkPage(this.list, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BookmarkController bookmarkController = Get.find();
    final ProductController productController = Get.find();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.h,
        centerTitle: true,
        title: Text(
          'BOOKMARK',
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              color: Colors.black87,
            ),
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Bookmark anda',
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  color: Colors.black,
                ),
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(5, 2, 5, 0),
                child: Expanded(
                  child: Obx(
                    () => AlignedGridView.count(
                      itemCount: bookmarkController.bookmarkList.length,
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      itemBuilder: (context, index) {
                        return ProductView(
                          productController.productList.firstWhere(
                            (element) =>
                                element.id ==
                                bookmarkController.bookmarkList[index].id,
                          ),
                          additionalWidget: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: 6.h,
                                ),
                                Text(
                                    'Bookmarked at : ${bookmarkController.bookmarkList[index].bookmarkedAt}')
                              ]),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
