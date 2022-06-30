import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/product.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatelessWidget {
  final List<Product> list;
  const CartPage(this.list, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            height: 10.h,
            color: Colors.black,
          ),
          itemBuilder: (context, item) => ListTile(
            leading: CachedNetworkImage(
              imageUrl: list[item].imageUrl[0],
              imageBuilder: (context, imageProvider) => SizedBox(
                height: 100,
                width: 100,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Image.asset(
                cupertinoActivityIndicator,
                fit: BoxFit.contain,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            title: Text(list[item].name),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {},
            ),
          ),
          itemCount: list.length,
        ))
      ],
    );
  }
}
