import 'package:flutter/material.dart';
import 'package:bestbrand/components/product_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../models/product.dart';

class SearchPage extends StatelessWidget {
  final List<Product> list;
  const SearchPage(
    this.list, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextField(
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
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                          onPressed: null,
                          icon: Icon(Icons.filter_alt_outlined),
                          label: Text('Filter')),
                      TextButton.icon(
                          onPressed: null,
                          icon: Icon(Icons.sort_by_alpha_outlined),
                          label: Text('Sort')),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: AlignedGridView.count(
                      itemCount: list.length,
                      crossAxisCount: list.length,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      itemBuilder: (context, index) {
                        return ProductView(list[index]);
                      },
                    ),
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
