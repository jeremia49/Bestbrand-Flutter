import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.h,
        centerTitle: true,
        title: Text(
          'PENGATURAN',
          style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              color: Colors.black87,
            ),
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dark Mode',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                    ),
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Switch(
                  value: false,
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
