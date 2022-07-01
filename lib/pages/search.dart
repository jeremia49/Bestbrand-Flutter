import 'package:flutter/material.dart';
import 'package:bestbrand/components/product_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../controllers/product_controller.dart';
import '../models/product.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            border: OutlineInputBorder(),
          ),
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
                    itemCount: productController.productList.length,
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    itemBuilder: (context, index) {
                      return ProductView(productController.productList[index]);
                    },
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
