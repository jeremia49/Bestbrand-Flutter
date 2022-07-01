import 'package:flutter/material.dart';
import 'package:bestbrand/components/product_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/product_controller.dart';
import '../models/product.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late List<Product> result;
  String searchquery = '';
  String? filter;
  String? sortcategory;
  bool? sort;

  List<Product> searchq(List<Product> productList, String searchquery) {
    final query = searchquery.toLowerCase();
    return productList.where((e) {
      final namaProduk = e.name.toLowerCase();
      return namaProduk.contains(query);
    }).toList();
  }

  int getPrice(Product product) {
    if (product.isPromo) {
      return product.hargaPromo;
    }
    return product.harga;
  }

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find();
    if (searchquery.isEmpty) {
      result = List.of(productController.productList);
    }
    if (filter != null) {
      if (filter == 'diskon') {
        result = result.where((e) => e.isPromo == true).toList();
      } else {
        result = result.where((e) => e.tag.contains(filter)).toList();
      }
    }
    if (sort != null && sortcategory != null) {
      if (sortcategory == 'name') {
        if (sort == true) {
          result.sort((a, b) => a.name.compareTo(b.name));
        } else {
          result.sort((a, b) => b.name.compareTo(a.name));
        }
      } else if (sortcategory == 'harga') {
        if (sort == true) {
          result.sort((a, b) => getPrice(a).compareTo(getPrice(b)));
        } else {
          result.sort((a, b) => getPrice(b).compareTo(getPrice(a)));
        }
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        TextField(
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,
                size: 20.sp,
              ),
              border: const OutlineInputBorder(),
              hintText: 'Ketik produk yang anda cari ...'),
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 15.sp,
            ),
            fontWeight: FontWeight.normal,
          ),
          onChanged: ((e) {
            setState(
              () {
                searchquery = e;
                result = List.of(searchq(productController.productList, e));
              },
            );
          }),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 2, 5, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25),
                          )),
                          builder: (context) => Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Filter berdasarkan :',
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.sp,
                                    ),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Wrap(
                                  children: [
                                    FilterChip(
                                      selected: filter == 'diskon',
                                      label: Text(
                                        'Diskon',
                                        style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.sp,
                                          ),
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      onSelected: (bool value) {
                                        setState(() {
                                          if (filter == 'diskon') {
                                            filter = null;
                                          } else {
                                            filter = 'diskon';
                                          }
                                        });
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    FilterChip(
                                      selected: filter == 'keyboard',
                                      label: Text(
                                        'Keyboard',
                                        style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.sp,
                                          ),
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      onSelected: (bool value) {
                                        setState(() {
                                          if (filter == 'keyboard') {
                                            filter = null;
                                          } else {
                                            filter = 'keyboard';
                                          }
                                        });
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    FilterChip(
                                      selected: filter == 'kursi',
                                      label: Text(
                                        'Kursi',
                                        style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.sp,
                                          ),
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      onSelected: (bool value) {
                                        setState(() {
                                          if (filter == 'kursi') {
                                            filter = null;
                                          } else {
                                            filter = 'kursi';
                                          }
                                        });
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.filter_alt_outlined,
                        size: 17.sp,
                        color: Colors.black,
                      ),
                      label: Text(
                        'Filter',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                          ),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25),
                          )),
                          builder: (context) => Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Sorting berdasarkan :',
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.sp,
                                    ),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Wrap(
                                  children: [
                                    FilterChip(
                                      selected: sortcategory == 'name',
                                      label: Text(
                                        'Nama',
                                        style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.sp,
                                          ),
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      onSelected: (bool value) {
                                        setState(() {
                                          if (sortcategory == 'name') {
                                            sortcategory = null;
                                          } else {
                                            sortcategory = 'name';
                                          }
                                        });
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    FilterChip(
                                      selected: sortcategory == 'harga',
                                      label: Text(
                                        'Harga',
                                        style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.sp,
                                          ),
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      onSelected: (bool value) {
                                        setState(() {
                                          if (sortcategory == 'harga') {
                                            sortcategory = null;
                                          } else {
                                            sortcategory = 'harga';
                                          }
                                        });
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  'Secara :',
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.sp,
                                    ),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Wrap(
                                  children: [
                                    FilterChip(
                                      selected: sort == true,
                                      label: Text(
                                        'Menaik',
                                        style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.sp,
                                          ),
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      onSelected: (bool value) {
                                        setState(() {
                                          if (sort == true) {
                                            sort = null;
                                          } else {
                                            sort = true;
                                          }
                                        });
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    SizedBox(
                                      width: 10.h,
                                    ),
                                    FilterChip(
                                      selected: sort == false,
                                      label: Text(
                                        'Menurun',
                                        style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.sp,
                                          ),
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      onSelected: (bool value) {
                                        setState(() {
                                          if (sort == false) {
                                            sort = null;
                                          } else {
                                            sort = false;
                                          }
                                        });
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.sort_by_alpha_outlined,
                        size: 18.sp,
                        color: Colors.black,
                      ),
                      label: Text(
                        'Sort',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                          ),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: AlignedGridView.count(
                    itemCount: result.length,
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    itemBuilder: (context, index) {
                      return ProductView(result[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
