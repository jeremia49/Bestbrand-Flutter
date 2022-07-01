import 'package:bestbrand/provider/nightmode.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<NightModeProvider>().nightmode
          ? Colors.black
          : Colors.white,
      appBar: AppBar(
        backgroundColor: context.watch<NightModeProvider>().nightmode
            ? Color.fromARGB(255, 99, 88, 88)
            : Color.fromARGB(0xF, 0x9, 0xF, 0x9),
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
                      color: context.watch<NightModeProvider>().nightmode
                          ? Colors.white
                          : Colors.black,
                      fontSize: 16.sp,
                    ),
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Builder(
                  builder: (context) => Switch(
                    value: context.watch<NightModeProvider>().nightmode,
                    onChanged: (value) {
                      context.read<NightModeProvider>().setNightMode(value);
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
