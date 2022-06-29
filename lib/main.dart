import 'package:bestbrand/components/product_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

import 'models/product.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  runApp(const MyApp());
}

List<Product> productList = [
  Product(
    'KOODO Gecko 60% Layout RGB Mechanical Keyboard',
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
    return GetMaterialApp(
      title: 'BEST-BRAND',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Best Brand',
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Tawaran terbaik hari ini',
                textAlign: TextAlign.left,
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Builder(
                builder: (context) {
                  return CarouselSlider(
                      options: CarouselOptions(
                        enableInfiniteScroll: false,
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                      ),
                      items: (() {
                        List<Widget> carousel = [];
                        for (int i = 0; i < productList.length; i++) {
                          carousel.add(Row(
                            children: [
                              ProductView(productList[i]),
                              SizedBox(
                                width: 4,
                              ),
                              (() {
                                if ((i + 1) != productList.length) {
                                  i++;
                                  return ProductView(productList[i]);
                                } else {
                                  return SizedBox(
                                    width: 250,
                                  );
                                }
                              })(),
                            ],
                          ));
                        }
                        return carousel;
                      })());
                },
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.shopping_cart), label: 'Cart'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.account_circle_rounded), label: 'My Account'),
      //   ],
      //   backgroundColor: Colors.grey,
      //   selectedItemColor: Colors.blue,
      //   showSelectedLabels: true,
      //   showUnselectedLabels: false,
      //   unselectedItemColor: Colors.black,
      // ),
    );
  }
}
