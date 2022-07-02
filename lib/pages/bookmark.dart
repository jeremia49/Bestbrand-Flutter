import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../components/product_view.dart';
import '../controllers/bookmark_controller.dart';
import '../controllers/product_controller.dart';
import '../models/product.dart';
import '../provider/nightmode.dart';

class BookmarkPage extends StatelessWidget {
  BookmarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BookmarkController bookmarkController = Get.find();
    final ProductController productController = Get.find();

    return Scaffold(
      backgroundColor: context.watch<NightModeProvider>().nightmode
          ? Colors.black
          : Colors.white,
      appBar: AppBar(
        backgroundColor: context.watch<NightModeProvider>().nightmode
            ? const Color.fromARGB(255, 99, 88, 88)
            : const Color.fromARGB(0xF, 0x9, 0xF, 0x9),
        toolbarHeight: 60.h,
        centerTitle: true,
        title: Text(
          'BOOKMARK',
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              color: context.watch<NightModeProvider>().nightmode
                  ? Colors.white
                  : Colors.black87,
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
                textStyle: TextStyle(
                  color: context.watch<NightModeProvider>().nightmode
                      ? Colors.white
                      : Colors.black87,
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
                padding: const EdgeInsets.fromLTRB(5, 2, 5, 0),
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
                                'Bookmarked at : ${bookmarkController.bookmarkList[index].bookmarkedAt}',
                                style: TextStyle(
                                  color: context
                                          .watch<NightModeProvider>()
                                          .nightmode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              )
                            ]),
                      );
                    },
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
