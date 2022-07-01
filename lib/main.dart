import 'package:bestbrand/pages/account.dart';
import 'package:bestbrand/pages/cart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bestbrand/pages/home.dart';
import 'package:bestbrand/pages/search.dart';
import 'package:bestbrand/provider/menu.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:bestbrand/dummy_data.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MenuProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'BEST-BRAND',
          theme: ThemeData(
            primarySwatch: Colors.grey,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
      child: const MyHomePage(),
    );
  }
}

List<String> titles = [
  'BEST-BRAND',
  'PENCARIAN',
  'CART',
  'AKUNKU',
];

List<Widget> pages = [
  HomePage(productList),
  SearchPage(productList),
  CartPage(productList),
  const AccountPage(),
];

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.h,
        centerTitle: true,
        title: Text(
          titles[context.watch<MenuProvider>().menu],
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              color: Colors.black87,
            ),
            fontWeight: FontWeight.w900,
          ),
        ),
        backgroundColor: Color.fromARGB(0xF, 0x9, 0xF, 0x9),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: pages[context.watch<MenuProvider>().menu],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded), label: 'My Account'),
        ],
        onTap: (int e) {
          context.read<MenuProvider>().setMenu(e);
        },
        currentIndex: context.watch<MenuProvider>().menu,
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
      ),
    );
  }
}
