import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/product_view.dart';
import '../models/product.dart';

class BookmarkPage extends StatelessWidget {
  final List<Product> list;
  const BookmarkPage(this.list, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    child: AlignedGridView.count(
                      itemCount: list.length,
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      itemBuilder: (context, index) {
                        return ProductView(list[index]);
                      },
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
