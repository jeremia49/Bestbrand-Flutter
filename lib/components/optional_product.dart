import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../provider/nightmode.dart';

class OptionalProduct extends StatelessWidget {
  OptionalProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 394.w,
      height: 96.h,
      decoration: BoxDecoration(
        color: context.watch<NightModeProvider>().nightmode
            ? const Color.fromARGB(255, 53, 51, 51)
            : const Color.fromARGB(0xF, 0x9, 0xF, 0x9),
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content:
                      Text('Mohon maaf, saat ini masih dalam pengembangan')));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/4.png',
                  fit: BoxFit.contain,
                  width: 48.w,
                  height: 48.h,
                ),
                Text(
                  'Pulsa',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: context.watch<NightModeProvider>().nightmode
                          ? Colors.white
                          : Colors.black,
                      fontSize: 14.sp,
                    ),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content:
                      Text('Mohon maaf, saat ini masih dalam pengembangan')));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/5.png',
                  fit: BoxFit.contain,
                  width: 48.w,
                  height: 48.h,
                ),
                Text(
                  'PLN',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: context.watch<NightModeProvider>().nightmode
                          ? Colors.white
                          : Colors.black,
                      fontSize: 14.sp,
                    ),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content:
                      Text('Mohon maaf, saat ini masih dalam pengembangan')));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/6.png',
                  fit: BoxFit.contain,
                  width: 48.w,
                  height: 48.h,
                ),
                Text(
                  'BPJS',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: context.watch<NightModeProvider>().nightmode
                          ? Colors.white
                          : Colors.black,
                      fontSize: 14.sp,
                    ),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content:
                      Text('Mohon maaf, saat ini masih dalam pengembangan')));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/7.png',
                  fit: BoxFit.contain,
                  width: 48.w,
                  height: 48.h,
                ),
                Text(
                  'PDAM',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: context.watch<NightModeProvider>().nightmode
                          ? Colors.white
                          : Colors.black,
                      fontSize: 14.sp,
                    ),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
