import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 244, 255, 247),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          print('Hello World');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              child: CachedNetworkImage(
                imageUrl:
                    'https://images.tokopedia.net/img/cache/700/VqbcmM/2021/12/31/be6c7b3d-b698-4a3a-b36c-67f94ea2ce73.jpg.webp?ect=4g',
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
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
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          'KOODO Gecko 60% Layout RGB Mechanical Keyboard',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              color: Colors.black,
                            ),
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                          softWrap: true,
                        ),
                      ),
                      Icon(Icons.bookmark)
                    ],
                  ),
                  Text(
                    'Rp 490.000',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    'Rp 680.000',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Colors.black45,
                      ),
                      fontWeight: FontWeight.normal,
                      fontSize: 10,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star_outlined,
                        color: Colors.yellow,
                      ),
                      Text(
                        '4.9 (500)',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
