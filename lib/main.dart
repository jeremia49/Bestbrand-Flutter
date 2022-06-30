import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bestbrand/pages/home.dart';
import 'package:bestbrand/pages/search.dart';
import 'package:bestbrand/provider/menu.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import 'models/product.dart';

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

List<Product> productList = [
  Product(
    1,
    'KOODO Gecko 60% Layout RGB Mechanical KeyboardAHAEHEATHAETHEATIHONEATIHNEATIHNEATOHEATNHOEATHNOEATOEATRNBEAO EATROTRGHAETROTHG EAROHEARHOEAR HOEAHEAO',
    680000,
    '''KOODO Gecko Series memiliki bentuk yang lebih compact dan portable dengan Layout 60% sehingga sangat cocok untuk kamu yang tidak suka dengan Mechanical Keyboard berukuran besar.
Gecko Series juga sudah dilengkapi dengan teknologi Bluetooth 5.0 sehingga kamu dapat menikmatin pengalaman gaming tanpa kabel (Wireless) dengan delay yang sangat minim (Very-Low Latency).

Specification :
- 60% Layout
- 50M-click lifespan
- up to 1000hz polling rate
- Outemu switches
- Universal Hotswapable 3-5 pin
- Bluetooth 5.0 (Very Low Latency Gaming Experience)
- Battery Lipo 2400maH* (Tahan 48 Jam per charge)''',
    [
      'https://images.tokopedia.net/img/cache/900/VqbcmM/2021/12/31/be6c7b3d-b698-4a3a-b36c-67f94ea2ce73.jpg',
      'https://images.tokopedia.net/img/cache/900/VqbcmM/2021/12/31/fe2d9702-03db-4578-8b75-f29f198e7d68.jpg',
      'https://images.tokopedia.net/img/cache/900/VqbcmM/2021/12/31/e97b2a29-4577-40d6-bc0d-987ca2544534.jpg',
      'https://images.tokopedia.net/img/cache/900/VqbcmM/2021/12/31/4ba0a1c2-0a16-4eff-ae35-3fdf4f31f8bb.jpg',
    ],
    isPromo: true,
    hargaPromo: 490000,
    rating: 4.9,
    ratingCounter: 500,
  ),
  Product(
    2,
    'Sades Rainbow Mechanical Keyboard Cap',
    135000,
    '''Sades Rainbow Keycap untuk kustom keyboard mechanical anda
terdiri dari 37 key.
Warna: Rainbow
Kompatible ke semua keyboard Sades
''',
    [
      'https://images.tokopedia.net/img/cache/900/VqbcmM/2022/2/19/4adf8569-ced6-49c4-8c35-3ca873e267c4.jpg',
      'https://images.tokopedia.net/img/cache/900/VqbcmM/2022/2/19/b2b48789-221b-4bd1-866a-163b25a9a34e.jpg',
      'https://images.tokopedia.net/img/cache/900/VqbcmM/2022/2/19/c1bf2116-4802-4bcd-b1a3-c3efe0bcf47b.jpg',
      'https://images.tokopedia.net/img/cache/900/VqbcmM/2022/2/19/218458f2-f895-4ce1-98cd-9614a35e9363.jpg',
    ],
    isPromo: true,
    hargaPromo: 120000,
    rating: 4.8,
    ratingCounter: 60,
  ),
  Product(
    3,
    'Sades Rainbow Mechanical Keyboard Cap',
    135000,
    '''Sades Rainbow Keycap untuk kustom keyboard mechanical anda
terdiri dari 37 key.
Warna: Rainbow
Kompatible ke semua keyboard Sades
''',
    [
      'https://images.tokopedia.net/img/cache/900/VqbcmM/2022/2/19/4adf8569-ced6-49c4-8c35-3ca873e267c4.jpg',
      'https://images.tokopedia.net/img/cache/900/VqbcmM/2022/2/19/b2b48789-221b-4bd1-866a-163b25a9a34e.jpg',
      'https://images.tokopedia.net/img/cache/900/VqbcmM/2022/2/19/c1bf2116-4802-4bcd-b1a3-c3efe0bcf47b.jpg',
      'https://images.tokopedia.net/img/cache/900/VqbcmM/2022/2/19/218458f2-f895-4ce1-98cd-9614a35e9363.jpg',
    ],
    isPromo: true,
    hargaPromo: 120000,
    rating: 4.8,
    ratingCounter: 60,
  ),
  Product(
    4,
    'Sades Rainbow Mechanical Keyboard Cap',
    135000,
    '''Sades Rainbow Keycap untuk kustom keyboard mechanical anda
terdiri dari 37 key.
Warna: Rainbow
Kompatible ke semua keyboard Sades
''',
    [
      'https://images.tokopedia.net/img/cache/900/VqbcmM/2022/2/19/4adf8569-ced6-49c4-8c35-3ca873e267c4.jpg',
      'https://images.tokopedia.net/img/cache/900/VqbcmM/2022/2/19/b2b48789-221b-4bd1-866a-163b25a9a34e.jpg',
      'https://images.tokopedia.net/img/cache/900/VqbcmM/2022/2/19/c1bf2116-4802-4bcd-b1a3-c3efe0bcf47b.jpg',
      'https://images.tokopedia.net/img/cache/900/VqbcmM/2022/2/19/218458f2-f895-4ce1-98cd-9614a35e9363.jpg',
    ],
    isPromo: true,
    hargaPromo: 120000,
    rating: 4.8,
    ratingCounter: 60,
  ),
];

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
];

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          padding: EdgeInsets.all(10),
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
      ),
    );
  }
}
