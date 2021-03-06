import 'package:bestbrand/pages/bookmark.dart';
import 'package:bestbrand/pages/setting.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../provider/nightmode.dart';

const List<String> list = [
  'Pengaturan',
  'Bookmark',
  'Keluar App',
];

void action(BuildContext context, int item) {
  switch (item) {
    case 0:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SettingPage(),
        ),
      );
      break;
    case 1:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BookmarkPage(),
        ),
      );
      break;
    case 2:
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      break;
    default:
  }
}

class AccountPage extends StatelessWidget {
  AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.account_circle_rounded,
              size: 120.sp,
              color: context.watch<NightModeProvider>().nightmode
                  ? Colors.white
                  : Colors.black,
            ),
            Text(
              'UserAccount',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: context.watch<NightModeProvider>().nightmode
                      ? Colors.white
                      : Colors.black,
                  fontSize: 16.sp,
                ),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 50.h,
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              height: 20,
              color: context.watch<NightModeProvider>().nightmode
                  ? Colors.white
                  : Colors.black,
            ),
            itemBuilder: (context, item) => ListTile(
              onTap: () {
                action(context, item);
              },
              title: Text(
                list[item],
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
              trailing: IconButton(
                icon: Icon(
                  Icons.navigate_next,
                  color: context.watch<NightModeProvider>().nightmode
                      ? Colors.white
                      : Colors.black,
                ),
                onPressed: () {
                  action(context, item);
                },
              ),
            ),
            itemCount: list.length,
          ),
        )
      ],
    );
  }
}
