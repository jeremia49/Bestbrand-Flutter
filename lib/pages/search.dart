import 'package:bestbrand/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:bestbrand/components/product_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

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

  List<Product> searchq(List<Product> productList, String searchquery) {
    final query = searchquery.toLowerCase();
    return productList.where((e) {
      final namaProduk = e.name.toLowerCase();
      return namaProduk.contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find();
    if (searchquery.isEmpty) {
      result = productController.productList;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        TextField(
          decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              border: OutlineInputBorder(),
              hintText: 'Ketik produk yang anda cari ...'),
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
                        onPressed: null,
                        icon: const Icon(Icons.filter_alt_outlined),
                        label: const Text('Filter')),
                    TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.sort_by_alpha_outlined),
                        label: const Text('Sort')),
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
